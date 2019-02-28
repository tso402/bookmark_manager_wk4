require 'sinatra/base'
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  enable :method_override
  get '/' do
    redirect ('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmark' do
    Bookmark.create(params[:url], params[:title])
    redirect ('/bookmarks')
  end

  delete '/remove' do
    Bookmark.remove(params[:removal_link])
    redirect ('/bookmarks')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
