require "pg"

class Bookmark
  DATABASE_NAME = "bookmark_manager"
  TABLE_NAME = "bookmarks"

  def initialize(list = [])
    @list = list
    @db_connection = db_connect(DATABASE_NAME)
  end

  def all(field = "*", field_value = nil, table = TABLE_NAME)
    @field_value = field_value
    @field = field
    @table = table
    @list.empty? ? get_bookmarks : @list
  end

  def get_bookmarks(where_state = "")
    where_state << " WHERE " << @field_value[0] << " = '" << @field_value[1].to_s << "'" unless @field_value.nil? 
    list = @db_connection.exec("SELECT " << @field << " FROM " << @table << where_state << ";")
    list.map{ |value| value[@field] } if @field != "*"
  end

  def db_connect(db_name = DATABASE_NAME)
    PG.connect(dbname: db_name)
  end

end