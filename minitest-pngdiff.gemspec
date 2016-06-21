# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/pngdiff/version'

Gem::Specification.new do |spec|
  spec.name          = 'minitest-pngdiff'
  spec.version       = Minitest::Pngdiff::VERSION
  spec.authors       = ['Stafford Brunk']
  spec.email         = ['sbrunk@customink.com']

  spec.summary       = 'Minitest matchers for comparing PNG images'
  spec.description   = 'This gem provides minitest matches that allows comparing PNG images for similarity'
  spec.homepage      = 'https://github.com/customink/minitest-pngdiff'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'minitest'
  spec.add_dependency 'chunky_png'
  spec.add_dependency 'oily_png'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
