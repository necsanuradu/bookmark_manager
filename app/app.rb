#!/usr/bin/env ruby
require "sinatra"
require "sinatra/reloader"

class Bookmark < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  run! if app_file ==$0
end