require 'logstash-logger'

module ArcadiaLogger
  module Adapters
    class Logstash < ArcadiaLogger::Adapter
      def initialize
        # URI scheme for LOGSTASH_URI: "#{type}://#{host}:#{port}/#{path}"
        # Defaults to UDP on 0.0.0.0 -> "udp://0.0.0.0:5228"
        @logger = ::LogStashLogger.new(uri: ENV['LOGSTASH_URI'], sync: true)
      end

      # ArcadiaLogger.log(severity: :debug, message: { test: "testing" }, options: { tags: ["test"] })
      def log(severity:, message:, options: {})
        if options[:tags]
          @logger.tagged(options[:tags]) { @logger.send(severity, message: message) }
        else
          @logger.send(severity, message: message)
        end
      end
    end
  end
end
