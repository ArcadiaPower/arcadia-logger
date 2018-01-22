require 'arcadia_logger/version'
require 'arcadia_logger/adapter'

module ArcadiaLogger
  module Adapters
    autoload :Logger, 'arcadia_logger/adapters/logger'
    autoload :Rollbar, 'arcadia_logger/adapters/rollbar'
  end

  @@adapters = { logger: Adapters::Logger.new }

  class << self
    def adapters=(value)
      @@adapters = value
    end

    def log(severity:, message:, adapters: @@adapters.keys, **extra_data)
      adapters.each do |adapter_id|
        @@adapters[adapter_id].log(severity: severity, message: message, **extra_data)
      end
    end

    def method_missing(name, *args, adapters: @@adapters.keys, **extra_data)
      log(severity: name, message: args.first, adapters: adapters, **extra_data)
    end

    def warn(*args, adapters: @@adapters.keys, **extra_data)
      log(severity: :warn, message: args.first, adapters: adapters, **extra_data)
    end

    def setup
      yield self
    end
  end
end
