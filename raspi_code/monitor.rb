#!/usr/bin/env ruby

require 'net/http'
require 'json'

class GreenhouseMonitor

  def initialize(kwargs={})
    @config = {
      :data_port => 4,
      :dht_model => 22,
      :delay => 60, # seconds between readings
      :database => nil,
      :server => nil,
      :logfile => 'greenhouse.log'
    }

    @config.update kwargs
    @log = File.open(@config[:logfile], 'a')
  end

  def start!
    log "Starting monitor."
    loop do

      data = take_reading
      log "Reading: Temp = #{data[:temperature]} C, Humidity = #{data[:humidity]}%"

      if !data[:temperature].nil? && !data[:humidity].nil?
        log "data #{data}"
        push_data(data)
      else
        log "data (bad) #{data}"
        sleep(3) # wait a little bit
        next # and try to take another reading.
      end
      sleep @config[:delay]
    end

  end

  private

  ##
  # Append to logfile
  #
  def log(s)
    logstring = "#{Time.now}\t#{s}"
    @log.puts logstring
    puts logstring
  end

  ##
  # Push data to server running in the cloud somewhere.
  #
  def push_data(data)
    uri = URI.parse("http://#{@config[:server]}/temperature/data")
    begin
      response = Net::HTTP.post_form(uri, data)
    rescue
      log puts "Error talking to server."
    else
      `sudo blink.py` # blinks are good.
    end
    log response
  end

  ##
  # Get reading from Adafruit DHT program
  # parse output and convert to hash.
  #
  def take_reading
    reading = `sudo Adafruit_DHT 22 4`
    log reading
    data = reading.match(/Temp = (.*) \*C, Hum = (.*)%/)
    temp = data[1].to_f rescue nil
    humidity = data[2].to_f rescue nil

    {
      :temperature => temp,
      :humidity => humidity,
      :raw => data
    }
  end
end

monitor = GreenhouseMonitor.new :server => 'triplab.ad.ufl.edu:4567'
monitor.start!
