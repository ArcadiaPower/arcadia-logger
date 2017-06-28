module ArcadiaLogger
  class Adapter
    def log(severity:, message:, options: {})
    end

    def method_missing(name, *args)
      log(severity: name, message: args.first)
    end

    def warn(*args)
      log(severity: :warn, message: args.first)
    end
  end
end
