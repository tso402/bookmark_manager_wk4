require 'bookmark'

describe Bookmark do
  let(:connection) {PG.connect(dbname: 'bookmark_manager_test')}
  describe '#all' do
    it 'returns all bookmarks' do
      create_bookmark('http://www.makersacademy.com')
      create_bookmark('http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end

  describe '#create' do
    it 'adds a new bookmark url to the database' do
      bookmark = {
        url: 'https://github.com',
        title: 'Github'
      }
      Bookmark.create(bookmark[:url], bookmark[:title])

      retrieved_bookmark = {}
      results = connection.exec "SELECT * FROM bookmarks where url = '#{bookmark[:url]}'"
      results.each do |row|
        retrieved_bookmark.merge!(url: row['url'], title: row['title'])
      end

      expect(retrieved_bookmark).to eq(bookmark)
    end
  end
end
