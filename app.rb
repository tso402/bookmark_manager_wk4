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

  post '/update' do
    Bookmark.read(id: params[:update_link])
    redirect ('/bookmarks/update')
  end

  get '/bookmarks/update' do
    @bookmark = Bookmark.read_bookmark
    erb(:update)
  end

  patch '/bookmarks/patch' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect ('/bookmarks')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
