# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weight/version'

Gem::Specification.new do |spec|
  spec.name          = "weight"
  spec.version       = Weight::VERSION
  spec.authors       = ["Anton Shemerey"]
  spec.email         = ["shemerey@gmail.com"]
  spec.description   = %q{Dead simple value object, with one purpose work with weight}
  spec.summary       = %q{
                          It's dead simple Value object, which provides convenient way
                          to work with weight in a different unit systems. It could be useful
                          if you have to work with different unit system, for example
                          you have to work with :kg as well as :lb for USA
                        }
  spec.homepage      = "https://github.com/shemerey/weight"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

end
