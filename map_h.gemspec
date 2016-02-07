# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "map_h"
  spec.version       = "0.1.0"
  spec.authors       = ["Rich Daley"]
  spec.email         = ["rich@fishpercolator.co.uk"]

  spec.summary       = %q{Adds a map_h method to Enumerable for easily building hashes}
  spec.description   = %q{Enumerable#map_h creates a hash using each element of the Enumerable.}
  spec.homepage      = "https://github.com/fishpercolator/map_h"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
