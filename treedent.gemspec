# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'treedent/version'

Gem::Specification.new do |spec|
  spec.name          = "treedent"
  spec.version       = Treedent::VERSION
  spec.authors       = ["Pete Nicholls"]
  spec.email         = ["pete@metanation.com"]

  spec.summary       = %q{A command-line tool for formatting indented text like `tree`.}
  spec.homepage      = "https://github.com/Aupajo/treedent"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
