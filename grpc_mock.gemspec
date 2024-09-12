# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grpc_mock/version'

Gem::Specification.new do |spec|
  spec.name          = 'grpc_mock'
  spec.version       = GrpcMock::VERSION
  spec.authors       = ['Yuta Iwama']
  spec.email         = ['ganmacs@gmail.com']

  spec.summary       = 'Library for stubbing grpc in Ruby'
  spec.description   = 'Library for stubbing grpc in Ruby'
  spec.homepage      = 'https://github.com/ganmacs/grpc_mock'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # grpc 1.65 has bug on request#to_h
  spec.add_dependency 'grpc', '>= 1.63.0', '< 2'

  spec.add_development_dependency 'bundler'
  # spec.add_development_dependency 'grpc-tools'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
