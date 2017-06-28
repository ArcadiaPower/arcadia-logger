require 'arcadia_logger/version'
require 'arcadia_logger/adapter'

module ArcadiaLogger
  module Adapters
    autoload :Logger, 'arcadia_logger/adapters/logger'
    autoload :Rollbar, 'arcadia_logger/adapters/rollbar'
    autoload :Logstash, 'arcadia_logger/adapters/logstash'
  end

  @@adapters = { logger: Adapters::Logger.new }

  class << self
    def adapters=(value)
      @@adapters = value
    end

    def log(severity:, message:, adapters: @@adapters.keys, options: {})
      adapters.each do |adapter_id|
        @@adapters[adapter_id].log(severity: severity, message: message, options: options)
      end
    end

    def method_missing(name, *args, adapters: @@adapters.keys, options: {})
      log(severity: name, message: args.first, adapters: adapters, options: options)
    end

    def warn(*args, adapters: @@adapters.keys)
      log(severity: :warn, message: args.first, adapters: adapters)
    end

    def setup
      yield self
    end
  end
end
