require "pg"

class Bookmark

  def initialize(list = [])
    @list = list
    @db_connection = db_connect("bookmark_manager")
  end

  def all(tag = nil)
    @list if tag.nil?
    @table_name = "bookmarks"
    # @db_connection.exec("SELECT FROM ")
  end

  def db_connect(db_name)
    PG.connect :dbname => db_name
  end

end