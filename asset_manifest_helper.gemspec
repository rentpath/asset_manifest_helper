# -*- encoding: utf-8 -*-
require File.expand_path('../lib/asset_manifest_helper/version', __FILE__)
require 'date'

Gem::Specification.new do |gem|
  gem.name        = 'asset_manifest_helper'
  gem.authors     = ['Sam Brauer', 'RentPath']
  gem.email       = ['sbrauer@rentpath.com']
  gem.homepage    = 'https://github.com/rentpath/asset_manifest_helper'
  gem.description = 'Rails and Sinatra helpers for generating URLs from a JSON manifest'
  gem.summary     = "Provides helper methods to get full paths and url to (possibly finger-printed) assets from JSON manifest files."
  gem.version     = AssetManifestHelper::VERSION
  gem.license     = 'MIT'

  gem.executables = []
  gem.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec)/}) }
  gem.require_paths = ['lib']
  gem.required_ruby_version = '>= 1.9'

  gem.add_development_dependency 'bundler', '~> 1.8'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.2'
end
