require 'bundler'
Bundler.require :twitter

require 'open-uri'
require 'json'

ENDPOINT = 'http://triplab.ad.ufl.edu:4567/measurement/latest.json'
HIGH_THRESHOLD = 37 # Celsius
LOW_THRESHOLD = 10
DELAY= 60 # seconds.
OWNER = '@heyaudy'

def get_reading
  data = JSON.parse(open(ENDPOINT).read)
  p data

  temp = data['temperature']
  humidity = data['humidity']
  time = Time.parse(data['created_at'])
  time_string = time.localtime.strftime('%H:%M %a %B, %u')

  { :temperature => temp, :humidity => humidity, :time => time, :time_string => time_string }
end

def get_reading_string(data)
  str = "#{data[:temperature]}C #{data[:humidity]}% at (#{data[:time_string]})"
  puts str
  str
end

scheduler = Rufus::Scheduler.start_new

scheduler.every '1m' do

  puts 'checking twitter...'
  data = get_reading
  reading_string = get_reading_string(data)

  replies do |tweet|
    if tweet.text# =~ /reading/
      reply "#USER# #{reading_string}", tweet
    end
  end
  update_config
end

##
#
# Alerts!
#
# todo: break this code out into some sort of alert system
# that can both tweet and send SMS messages via twilio...
#
scheduler.every '5m' do

  puts 'checking alerts...'

  data = get_reading
  reading_string = get_reading_string(data)

  # need to add something to prevent this from happening every 60 seconds...
  # if temperature is out of range
  if data[:temperature] >= HIGH_THRESHOLD or data[:temperature] <= LOW_THRESHOLD
    tweet "DANGER! #{OWNER} #{reading_string}"
  end

  # if we haven't had an update in a while (30 minutes).
  if (Time.now - data[:time]) > (60*30)
    tweet "DANGER! #{OWNER} We no get signal!"
  end

  update_config
end

##
# Updates on the hour
#
scheduler.every '1h' do
  data = get_reading
  reading_string = get_reading_string(data)

  tweet reading_string
end

scheduler.join
