def get_test_grid_bookmark_manager_test_db
  test_grid = ["http://www.makersacademy.com/",
               "http://www.google.com/",
               "http://www.destroyallsoftware.com"]
  reset_db_test_enviroment(test_grid)
  test_grid
end

def reset_db_test_enviroment(test_grid = [], db_connection = PG.connect(dbname: ENV["DATABASE_NAME_TEST"]))
  db_connection.exec("DELETE FROM bookmarks")
  test_grid.each do |test_value|
    db_connection.exec("INSERT INTO bookmarks(url) VALUES('" << test_value << "');")
  end
end

