require 'bundler'
Bundler.require :twitter

require 'yaml'

# load config from yaml.
twitter_config = YAML.load('oath_twitter.yml')

Twitter.configure do |config|
  config.consumer_key = twitter_config[:consumer_key]
  config.consumer_secret = twitter_config[:consumer_secret]
  config.oauth_token = twitter_config[:oauth_token]
  config.oauth_token_secret = twitter_config[:oauth_token_secret]
end
