require 'spec_helper'

RSpec.describe ArcadiaLogger::Adapters::Logger do
  subject { described_class.new }

  it 'logs without extra data' do
    expect { subject.error('Short') }.to output(/ERROR -- : Short - {}/).to_stdout_from_any_process
  end

  it 'logs with optional extra data' do
    expect { subject.error('Test', some: :nonsense) }.to output(/ERROR -- : Test - {:some=>:nonsense}/).to_stdout_from_any_process
  end
end
