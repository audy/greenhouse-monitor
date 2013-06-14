require './environment.rb'
require 'sinatra'

class Skellington < Sinatra::Base

  enable :sessions
  
  register Sinatra::AssetPack
  
  assets do
    serve '/js',     from: 'assets/js'
    serve '/css',    from: 'assets/css'
    # serve '/images': from: 'assets/images'
    
    css :main, ['/css/*.css']
    js :main, ['/js/*.js']
    
    prebuild true
  end

  helpers do

    def authenticate!
      redirect '/' unless @user
    end

  end

  before do
    @user = User.get(session[:user_id])
  end

  get '/' do
    haml :home
  end

end