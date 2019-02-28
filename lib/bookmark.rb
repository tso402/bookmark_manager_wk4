require 'pg'

class Bookmark
  attr_reader :url, :title, :id
  def self.all
    @bookmark_array =[]
    if ENV['RACK_ENV'] == 'test'
    conn = PG.connect(dbname: 'bookmark_manager_test' )
  else
    conn = PG.connect(dbname: 'bookmark_manager' )
  end
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row|
        @bookmark_array << Bookmark.new(row['id'],row['url'],row['title'])
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

  def self.remove(id)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect(dbname: 'bookmark_manager' )
    end
      conn.exec("DELETE FROM bookmarks where id=#{id.to_i}")
  end

  def self.update(id: id, url: url, title: title)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect(dbname: 'bookmark_manager' )
    end
    if title == ""
      title = @read_bookmark.title
    end
    if url == ""
      url = @read_bookmark.url
    end
    conn.exec("UPDATE bookmarks set title = '#{title}',url = '#{url}' WHERE id = #{id.to_i}")
  end

  def self.read(id: id)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect(dbname: 'bookmark_manager' )
    end
    result = conn.exec( "SELECT * FROM bookmarks where id = #{id.to_i}").first
    @read_bookmark = Bookmark.new(result['id'], result['url'], result['title'])
  end

  def self.read_bookmark
    @read_bookmark
  end

  def initialize(id, url,title)
    @id = id
    @url = url
    @title = title
  end
end
