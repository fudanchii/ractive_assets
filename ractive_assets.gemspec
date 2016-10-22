# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'ractive_assets/version'

Gem::Specification.new do |s|
  s.name          = "ractive_assets"
  s.version       = RactiveAssets::VERSION
  s.authors       = ["unity"]
  s.email         = ["romain@hull.io"]
  s.description   = %q{Use Ractive with the Sprockets asset pipeline.}
  s.summary       = %q{Use Ractive with the Sprockets asset pipeline.}
  s.homepage      = "https://github.com/unity/ractive_assets"
  s.license       = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "execjs", ">= 2.0.2"
  s.add_runtime_dependency "tilt"
  s.add_runtime_dependency "multi_json"
  s.add_runtime_dependency "sprockets"

  s.add_development_dependency "byebug"
  s.add_development_dependency "haml"
  s.add_development_dependency "rake"
  s.add_development_dependency "slim"
  s.add_development_dependency 'json', '~> 1.8.3'

end
