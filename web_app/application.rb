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
  end

  get '/' do
    @measurements = Measurement.all.to_a
    haml :home
  end

  get '/measurement/latest.json' do
    latest = Measurement.all.sort_by(:timestamp).last
    latest.attributes.to_json
  end

  post '/temperature/data' do
    reading = Measurement.create :temperature => params[:temperature].to_f,
                                 :humidity => params[:humidity].to_f,
                                 :timestamp => Time.now.to_time.to_i
    p reading
  end

end
