class Measurement
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :temp, Integer
  property :humidity, Integer
end
