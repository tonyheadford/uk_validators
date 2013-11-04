# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uk_validators/version'

Gem::Specification.new do |spec|
  spec.name          = "uk_validators"
  spec.version       = UkValidators::VERSION
  spec.authors       = ["Tony Headford"]
  spec.email         = ["tony@binarycircus.com"]
  spec.description   = %q{Rails Validations for typically UK specific data}
  spec.summary       = %q{Rails validations for UK data }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"

  spec.add_dependency "activemodel", ">= 3.2"
end
