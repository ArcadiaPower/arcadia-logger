# ArcadiaLogger

Simple abstraction for error/event logging - currently available are ruby logger and rollbar

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arcadia_logger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arcadia_logger

## Configuration
```ruby
# config/initializers/arcadia_logger.rb
ArcadiaLogger.setup do |config|
  config.adapters = {
    custom_logger: ArcadiaLogger::Adapters::Logger.new # STDOUT by default,
    rails_application_logger: ArcadiaLogger::Adapters::Logger.new(logger: Rails.logger),
    rollbar: ArcadiaLogger::Adapters::Rollbar.new # needs to be already configured (api key set) in your app
  }
end
```

## Usage
```ruby
# send to all adapters by default
ArcadiaLogger.log(severity: :error, message: 'message')

# only to selected adapters
ArcadiaLogger.log(severity: :error, message: 'message', adapters: [:custom_logger, :rollbar])

# ruby logger style
ArcadiaLogger.error('message')

# to selected adapters
ArcadiaLogger.error('message', adapters: [:custom_logger, :rollbar])

```






