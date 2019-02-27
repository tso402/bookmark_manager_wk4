require 'pg'

class Bookmark

  def self.all
    @bookmark_array =[]
    if ENV['RACK_ENV'] == 'test'
    conn = PG.connect(dbname: 'bookmark_manager_test' )
  else
    conn = PG.connect(dbname: 'bookmark_manager' )
  end
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row|
        @bookmark_array << row.values_at('url')[0]
      end
    end
    @bookmark_array
  end

  def self.create(url, title)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect(dbname: 'bookmark_manager' )
    end
      conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');")
  end
end
