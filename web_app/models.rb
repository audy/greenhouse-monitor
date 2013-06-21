require 'dm-core'
require 'dm-timestamps'

class Measurement
  include DataMapper::Resource

  property :id, Serial
  property :temperature, Float
  property :humidity, Float

  property :created_at, DateTime
end