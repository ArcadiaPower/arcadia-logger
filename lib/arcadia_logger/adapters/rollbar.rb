require 'rollbar'

module ArcadiaLogger
  module Adapters
    class Rollbar < ArcadiaLogger::Adapter
      def initialize
        @logger = ::Rollbar
      end

      def log(severity:, message:, **extra_data)
        @logger.log(severity, message, **extra_data)
      end
    end
  end
end
