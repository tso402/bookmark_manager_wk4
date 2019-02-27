require 'pg'

 def clear_test

   connection = PG.connect(dbname: 'bookmark_manager_test')
   connection.exec("TRUNCATE bookmarks;")
 end
