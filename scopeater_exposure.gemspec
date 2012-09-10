# -*- encoding: utf-8 -*-
require File.expand_path('../lib/scopeater_exposure/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Benoit Molenda"]
  gem.email         = ["benoit.molenda@gmail.com"]
  gem.description   = "ScopeaterExposure is a strategy for decent exposure gem using scopeater"
  gem.summary       = "It contains a scope exposure strategy and a scope hook behaviour for custom strategies"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "scopeater_exposure"
  gem.require_paths = ["lib"]
  gem.version       = ScopeaterExposure::VERSION
  
  gem.add_dependency 'scopeater'
  gem.add_dependency 'activesupport'
  gem.add_dependency 'decent_exposure'
  gem.add_development_dependency 'rspec'
end
