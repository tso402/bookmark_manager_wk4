require "sinatra/base"
require_relative "./lib/bookmark.rb"

class BookmarkManager<Sinatra::Base
  get "/" do
    @bookmarks = Bookmark.all_bookmarks
    erb :index
  end











  run! if app_file == $0
end
