# get temperatures over the last 24h
# averaged every hour

def average_temperature(args={})
  since = args[:since]
  averaged = args[:averaged] # hour, day, minute, etc...
  
  temps = Measurement.all(:created_at.gt => Time.new(since))
    .group_by { |x| x.created_at.send(averaged) }
    .map { |x| p x }
    .map { |x| [x[0], x[1].map(&:temperature).mean] }
    
  p temps
end