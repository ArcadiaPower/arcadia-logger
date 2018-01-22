require 'logger'

module ArcadiaLogger
  module Adapters
    class Logger < ArcadiaLogger::Adapter

      SEVERITY = {
        debug: ::Logger::Severity::DEBUG,
        info: ::Logger::Severity::INFO,
        warn: ::Logger::Severity::WARN,
        error: ::Logger::Severity::ERROR,
        fatal: ::Logger::Severity::FATAL
      }.freeze

      # you can pass rails logger here (logger: Rails.logger)
      def initialize(logger: ::Logger.new(STDOUT))
        @logger = logger
      end

      def log(severity:, message:, **extra_data)
        @logger.log(SEVERITY[severity] || ::Logger::Severity::UNKNOWN, "#{message} - #{extra_data}")
      end
    end
  end
end
