require File.join(File.dirname(__FILE__), '..', 'application')

require 'rack/test'
require 'bundler'

Bundler.require(:default, :test)

set :environment, :test
set :logging, false

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
