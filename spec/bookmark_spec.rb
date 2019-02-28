require 'bookmark'

describe Bookmark do
  let(:connection) {PG.connect(dbname: 'bookmark_manager_test')}
  describe '#all' do
    it 'returns all bookmarks' do
      create_bookmark('http://www.makersacademy.com', 'Makers')
      create_bookmark('http://www.destroyallsoftware.com', 'DAS')

      bookmarks = Bookmark.all

      expect(bookmarks.pop.url).to include("http://www.destroyallsoftware.com")
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

  describe '#delete' do
    it 'removes a bookmark from the database' do
  bookmark = {
    url: 'https://github.com',
    title: 'Github'
  }
  Bookmark.create(bookmark[:url], bookmark[:title])
  retrieved_bookmark = {}
      results = connection.exec "SELECT * FROM bookmarks where url = '#{bookmark[:url]}'"
      results.each do |row|
        retrieved_bookmark.merge!(id: row['id'], url: row['url'], title: row['title'])
      end
    Bookmark.remove(retrieved_bookmark[:id])
      results = connection.exec "SELECT * FROM bookmarks where id = #{retrieved_bookmark[:id].to_i}"
      results.first
      expect(results.first).to eq nil
    end
end

describe '#update' do
  it 'updates an existing bookmark title/url or both on the database' do
    bookmark = {
      url: 'https://github.com',
      title: 'Github'
    }
    Bookmark.create(bookmark[:url], bookmark[:title])
    retrieved_bookmark = {}
    results = connection.exec "SELECT * FROM bookmarks where url = '#{bookmark[:url]}'"
    results.each do |row|
      retrieved_bookmark.merge!(id: row['id'], url: row['url'], title: row['title'])
    end
    Bookmark.update(id: retrieved_bookmark[:id], title: "Github_updated", url: "http://github.com")
    results = connection.exec "SELECT * FROM bookmarks where id = #{retrieved_bookmark[:id].to_i}"
    expect(results.first['title']).to eq "Github_updated"
  end
end

describe '#read' do
  it 'reads an existing bookmark on the database' do
    bookmark = {
      url: 'https://github.com',
      title: 'Github'
    }
    Bookmark.create(bookmark[:url], bookmark[:title])
    retrieved_bookmark = {}
        results = connection.exec "SELECT * FROM bookmarks where url = '#{bookmark[:url]}'"
        results.each do |row|
          retrieved_bookmark.merge!(id: row['id'], url: row['url'], title: row['title'])
        end
        Bookmark.read(id: retrieved_bookmark[:id])
        read_bookmark = Bookmark.read_bookmark

        expect(read_bookmark.title).to eq "Github"
        expect(read_bookmark.id).to eq retrieved_bookmark[:id]
      end
end

end
