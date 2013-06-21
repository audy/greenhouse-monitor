require 'bundler'
require 'sinatra'
require 'json'

Bundler.require(:default)

require './models.rb'

DB_PATH = File.join(File.dirname(__FILE__), 'db')

class Skellington < Sinatra::Base

  DataMapper.finalize

  set :environment, :development
  set :root, File.dirname(__FILE__)

  configure :production do
    DataMapper.setup(:default,
                     :adapter => 'sqlite',
                     :database => File.join(DB_PATH, 'production.db'))
  end

  configure :development do

    DataMapper.setup(:default,
                     :adapter => 'sqlite',
                     :database => File.join(DB_PATH, 'development.db'))

    # so we can access over the network.
    set :bind, '0.0.0.0'

    # authomatic reloading
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  configure :test do
    DataMapper.setup(:default, 'sqlite::memory:')
  end

end
