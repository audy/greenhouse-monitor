require 'bundler'

Bundler.require(:default, :test)

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require File.join(File.dirname(__FILE__), '..', 'application')


Webrat.configure do |config|
  config.mode = :rack
end

RSpec.configure do |config|

  def app
    Skellington
  end

  config.before(:each) { DataMapper.auto_migrate! }

  config.include Rack::Test::Methods
  config.include Webrat::Matchers
  config.include Webrat::Methods
end
