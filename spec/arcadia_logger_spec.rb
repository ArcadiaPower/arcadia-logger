require 'spec_helper'

RSpec.describe ArcadiaLogger do
  context 'for several available adapters' do
    let(:adapter1) { double }
    let(:adapter2) { double }

    before do
      ArcadiaLogger.adapters = {
        adapter1: adapter1,
        adapter2: adapter2
      }
    end

    it 'logs to all adapters by default' do
      expect(adapter1).to receive(:log).with(severity: :info, message: 'message')
      expect(adapter2).to receive(:log).with(severity: :info, message: 'message')
      ArcadiaLogger.log(severity: :info, message: 'message')
    end

    it 'logs to selected adapters' do
      expect(adapter1).not_to receive(:log)
      expect(adapter2).to receive(:log).with(severity: :info, message: 'message')
      ArcadiaLogger.log(severity: :info, message: 'message', adapters: [:adapter2])
    end

    context 'logger style methods' do
      %i[debug info warn error fatal].each do |severity|
        it "logs with #{severity} severity" do
          expect(adapter1).to receive(:log).with(severity: severity, message: severity.to_s)
          ArcadiaLogger.send(severity, severity.to_s, adapters: [:adapter1])
        end
      end
    end
  end
end
