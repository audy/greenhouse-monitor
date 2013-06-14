require 'sinatra'
require 'bcrypt'
require 'bundler'

Bundler.require(:default)

require './models.rb'

class Skellington < Sinatra::Base

  DataMapper.finalize

  set :environment, :development
  set :root, File.dirname(__FILE__)

  DB_PATH = File.join(File.dirname(__FILE__), 'db')

  configure :development do
    DataMapper.setup(:default,
                     :adapter => 'sqlite',
                     :database => File.join(DB_PATH, 'development.db'))
    DataMapper.auto_upgrade!
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  configure :test do
    DataMapper.setup(:default, "sqlite::memory:")
  end

end