require 'pg'
class Bookmark
  @all_bookmarks ||= []
  attr_reader :name
  def initialize(name)
    @name = name
    self.class.all_bookmarks << self
  end
  def self.all_bookmarks
    con = PG.connect(dbname: 'bookmark_manager')
    con.exec("SELECT * FROM bookmarks") do |result|
      result.each do |row|
        @all_bookmarks << row.values_at('url')[0]
      end
    end
    @all_bookmarks
  end
end
