require 'pg'

  def clear_test
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("TRUNCATE bookmarks;")
 end

  def create_bookmark(url)
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
  end
