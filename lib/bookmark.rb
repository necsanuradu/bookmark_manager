require "pg"
require "./lib/post.rb"

class Bookmark
  DATABASE_NAME = "bookmark_manager"
  DATABASE_NAME_TEST = "bookmark_manager_test"
  ENV["DATABASE_NAME_TEST"] = DATABASE_NAME_TEST

  TABLE_NAME = "bookmarks"
  attr_reader :db_connection

  def initialize(list = [])
    @list = list
    db_name = DATABASE_NAME_TEST if ENV["RACK_ENV"] == "test"
    db_name = DATABASE_NAME unless ENV["RACK_ENV"] == "test"
    @db_connection = db_connect(db_name)
  end

  def all(field = "*", field_value = nil, table = TABLE_NAME)
    @field_value = field_value
    @field = field
    @table = table
    @list.empty? ? get_bookmarks : @list
  end

  def get_bookmarks(where_state = "")
    @field.respond_to?(:each) ? (fields = @field.join(", ")) : (fields = @field)
    where_state << " WHERE #{@field_value[0]} = '#{@field_value[1].to_s}'" unless @field_value.nil? 
    list = @db_connection.exec("SELECT #{fields} FROM #{@table}" << where_state << ";").to_a
    list.map! { |row| Post.new(row) }
  end

  def db_connect(db_name)
    db_connection = PG.connect(dbname: db_name)
  end

  def create(url, title = 'some')
    @db_connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end

end
