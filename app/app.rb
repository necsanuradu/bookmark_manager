require "sinatra"
require "sinatra/reloader"

class Bookmark < Sinatra::base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
end