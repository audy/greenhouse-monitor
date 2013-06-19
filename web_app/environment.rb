require 'bundler'
require 'sinatra'
require 'json'

Bundler.require(:default)

require './models.rb'

class Skellington < Sinatra::Base

  set :environment, :development
  set :root, File.dirname(__FILE__)

  DB_PATH = File.join(File.dirname(__FILE__), 'db')

  configure :development do
    # connect to redis.
    Ohm.connect

    # so we can access over the network.
    set :bind, '0.0.0.0'

    # authomatic reloading
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  configure :test do
  end

end
