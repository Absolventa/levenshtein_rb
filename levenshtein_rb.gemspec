# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'levenshtein_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "levenshtein_rb"
  spec.version       = LevenshteinRb::VERSION
  spec.authors       = ["Robin Neumann\n"]
  spec.email         = ["robin.neumann@absolventa.de"]
  spec.summary       = %q{Implementation of Levenshtein algorithm to determine the similarity of two strings using only Ruby}
  spec.description   = %q{Implementation of Levenshtein algorithm to determine the similarity of two strings using only Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
