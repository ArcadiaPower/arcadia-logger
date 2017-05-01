# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arcadia_logger/version'

Gem::Specification.new do |spec|
  spec.name          = 'arcadia_logger'
  spec.version       = ArcadiaLogger::VERSION
  spec.authors       = ['Iwo Dziechciarow']
  spec.email         = ['iiwo@o2.pl']

  spec.summary       = %q{Simple abstraction for ruby logging}
  spec.description   = %q{Enables flexible logging to multiple adapters by providing common interface}
  spec.homepage      = 'https://github.com/iiwo/arcadia_logger'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rollbar', '~> 0' # TODO: making adapters separate gems would allow to remove dependency

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
