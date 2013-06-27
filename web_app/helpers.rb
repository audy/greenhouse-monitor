# get temperatures over the last 24h
# averaged every hour

def average_temperature(args={})
  since = args[:since]
  averaged = args[:averaged] # hour, day, minute, etc...

  temps = Measurement.all(:created_at.gt => Time.at(since))
    .group_by { |x| x.created_at.send(averaged) }
    .map { |x| p [x[1].first.created_at, x[1].map(&:temperature).mean] }

  return temps
end