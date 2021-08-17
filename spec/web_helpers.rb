def reset_bookmark_manager_test_db
  test_grid = ["http://www.makersacademy.com/",
               "http://www.google.com/",
               "http://www.destroyallsoftware.com"]
end

def reset_db_test_enviroment(db_connection)
  test_grid = reset_bookmark_manager_test_db
  db_connection.exec("DELETE FROM bookmarks")
  test_grid.each do |test_value|
    db_connection.exec("INSERT INTO bookmarks(url) VALUES('" << test_value << "');")
  end
end

