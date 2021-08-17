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

  run! if app_file ==$0
end
