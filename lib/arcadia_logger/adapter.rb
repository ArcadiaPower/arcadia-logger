module ArcadiaLogger
  class Adapter
    def log(severity:, message:, **extra_data)
    end

    def method_missing(name, *args, **extra_data)
      log(severity: name, message: args.first, **extra_data)
    end

    def warn(*args, **extra_data)
      log(severity: :warn, message: args.first, **extra_data)
    end
  end
end
