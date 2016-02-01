require_relative 'asset_manifest_helper/configuration'
require_relative 'asset_manifest_helper/helpers'
require_relative 'asset_manifest_helper/version'
require_relative 'asset_manifest_helper/ties/rails' if defined?(Rails)
require_relative 'asset_manifest_helper/ties/sinatra' if defined?(Sinatra)
