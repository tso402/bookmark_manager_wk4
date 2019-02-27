require 'bookmark'

describe Bookmark do
  let(:connection) {PG.connect(dbname: 'bookmark_manager_test')}
  describe '#all' do
    it 'returns all bookmarks' do
      create_bookmark('http://www.makersacademy.com')
      create_bookmark('http://www.destroyallsoftware.com')
      create_bookmark('http://www.google.com')
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
      end
  end
  
  describe '#create' do
    it 'adds a new bookmark url to the database' do
      url = 'https://github.com'
      Bookmark.create(url)
      results = []
      connection.exec("SELECT * FROM bookmarks where url = '#{url}';") do |result|
        result.each do |row|
        results << row.values_at('url')[0]
        end
      end
      expect(results).to include(url)
    end  
  end
end
