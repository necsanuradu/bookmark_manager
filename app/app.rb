#!/usr/bin/env ruby
require "sinatra"
require "sinatra/reloader"
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  attr_accessor :bookmarks
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.new
    @list = @bookmarks.all("url")
    erb(:bookmarks)
  end

  get '/create_bookmark' do
    erb(:create_bookmark)
  end

  post '/save_bookmark' do
    @bookmarks = Bookmark.new
    @bookmarks.create(params[:url])
    redirect '/bookmarks'
  end
  run! if app_file ==$0
end
