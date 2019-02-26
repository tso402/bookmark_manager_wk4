require "bookmark"

describe Bookmark do
  it "returns an ampty array when we dont have any bookmarks" do
    expect(Bookmark.all_bookmarks.class).to eq Array
  end

  it "Includes a bookmark when it is made" do
    bookmark = Bookmark.new("http://www.makersacademy.com")
    expect(Bookmark.all_bookmarks).to include bookmark
  end

  it "The bookmark's name is shown when we use name method" do
    bookmark = Bookmark.new("http://www.makersacademy.com")
    expect(bookmark.name).to eq "http://www.makersacademy.com"
  end

  it "The bookmark contains the websites in the database" do
    expect(Bookmark.all_bookmarks).to include "http://www.google.com"
  end
end
