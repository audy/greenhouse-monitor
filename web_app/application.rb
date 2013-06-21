require './environment.rb'
require './helpers.rb'
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
    $stderr.puts Measurement.last.to_json
    Measurement.last.to_json
  end

  # actually, last 24h
  get '/measurement/day.json' do
    Measurement.all(:timestamp.gt => Time.now.to_i - 60*60*24).to_json
  end

  post '/temperature/data' do
    reading = Measurement.create :temperature => params[:temperature].to_f,
                                 :humidity => params[:humidity].to_f
    p reading
  end

end
