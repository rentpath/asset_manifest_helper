require 'json'

module AssetManifestHelper
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset_configuration
    @configuration = Configuration.new
  end

  class Configuration
    attr_accessor :asset_file, :bundle_file, :cache, :domain, :protocol

    # FIXME: Remove "public/assets/" from default paths? Too opinionated?
    def initialize(asset_file: 'public/assets/webpack-assets.json',
                   bundle_file: 'public/assets/webpack-bundles.json',
                   cache: false,
                   domain: 'example.com',
                   protocol: 'http')
      @asset_file  = asset_file
      @bundle_file  = bundle_file
      @cache = cache
      @domain  = domain
      @protocol = protocol
    end

    def asset_manifest
      if cache
        @asset_manifest ||= _asset_manifest
      else
        _asset_manifest
      end
    end

    def bundle_manifest
      if cache
        @bundle_manifest ||= _bundle_manifest
      else
        _bundle_manifest
      end
    end

    def _asset_manifest
      File.exists?(asset_file) ?  JSON.parse(File.read(asset_file)) : {}
    end

    def _bundle_manifest
      File.exists?(bundle_file) ?  JSON.parse(File.read(bundle_file)) : {}
    end
  end
end
