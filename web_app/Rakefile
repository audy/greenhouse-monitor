desc "start application console"
task :console do
  require 'irb'
  load 'environment.rb'
  ARGV.clear
  IRB.start
end

desc "run specs"
task :spec do
  sh 'rspec'
end

namespace :db do
  desc "seed the database with informatione"
  task :seed do
  end
  
  desc "auto migrate the database"
  task :automigrate do
    load 'environment.rb'
    fail "never auto_migrate! on the production server!" if $ENVIRONMENT == :production
    DataMapper.auto_migrate!
  end
end