#!/usr/bin/env ruby
require "sinatra"
require "sinatra/reloader"

class Bookmark < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/' do
    'Hello World'
  end

  run! if app_file ==$0
end