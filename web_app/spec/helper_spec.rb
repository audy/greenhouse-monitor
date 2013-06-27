require 'spec_helper'

describe 'average_temperature' do

  before(:each) {
    # create a bunch of temperatures over the last 24h
    start = Time.now.to_i - 60*60*24
    finish = Time.now.to_i
    step = 1024 # seconds

    (start..finish).step(step) do |n|
      m = Measurement.create :temperature => rand(100), :humidity => rand(100)
      # override timestamp
      m.created_at = Time.at(n)
      m.save!
    end
  }

  it 'should average the temperature hourly over the last 24h' do
    p average_temperature(:since => Time.now.to_i - 60*60*24, :averaged => :hour)
  end
end