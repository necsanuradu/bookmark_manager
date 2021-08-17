def reset_bookmark_manager_test_db(con = subject.db_connection)
  test_grid = ["http://www.makersacademy.com/", "http://www.google.com/", "http://www.destroyallsoftware.com"]
  con.exec("DELETE FROM bookmarks")
  test_grid.each do |test_value|
    con.exec("INSERT INTO bookmarks(url) VALUES('" << test_value << "');")
  end
  test_grid
end

