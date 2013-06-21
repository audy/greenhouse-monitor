require File.join(File.dirname(__FILE__), 'spec_helper')

describe Measurement do

  let(:measurement) { Measurement.create(:temperature => '29.4',
                                         :humidity => '32.4')
                     }

  it 'can be created' do
    measurement.should_not be_nil
  end

  it 'has a temperature' do
    measurement.temperature.should_not be_nil
  end

  it 'has a humidity' do
    measurement.humidity.should_not be_nil
  end

  it 'has a created at time stamp' do
    measurement.created_at.should_not be_nil
  end

end
