# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'websin/version'

Gem::Specification.new do |spec|
  spec.name          = "websin"
  spec.version       = Websin::VERSION
  spec.authors       = ["Daniel Mrozek"]
  spec.email         = ["mrazicz@gmail.com"]
  spec.description   = %q{Simple gem for easy slim template coding}
  spec.summary       = %q{Simple gem for easy slim template coding}
  spec.homepage      = "https://github.com/mrazicz/websin"
  spec.license       = "Unlicense"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'sinatra', '~> 1.0'
  spec.add_dependency 'tilt', '~> 1.4'
  spec.add_dependency 'thin'
  spec.add_dependency 'slim'
  spec.add_dependency 'sass'
  spec.add_dependency 'coffee'
  spec.add_dependency 'slop', '~> 3.5.0'
end

