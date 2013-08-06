require 'bundler'
require 'sinatra'
require 'json'

Bundler.require(:default)

require './models.rb'

class Skellington < Sinatra::Base

  DataMapper.finalize

  set :root, File.dirname(__FILE__)

  configure :production do
    DataMapper.setup(:default,
                     :adapter => 'postgres',
                     :database => ENV['HEROKU_POSTGRESQL_GREEN_URL'])
  end

  configure :development do

    DB_PATH = File.join(File.dirname(__FILE__), 'db')

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
