#!/usr/bin/env ruby
require "sinatra"
require "sinatra/reloader"
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmark = Bookmark.new
    @list = @bookmark.all("url")
    erb(:bookmarks)
  end

  run! if app_file ==$0
end