require 'rollbar'

module ArcadiaLogger
  module Adapters
    class Rollbar < ArcadiaLogger::Adapter
      def initialize
        @logger = ::Rollbar
      end

      def log(severity:, message:)
        @logger.log(severity, message)
      end
    end
  end
end
