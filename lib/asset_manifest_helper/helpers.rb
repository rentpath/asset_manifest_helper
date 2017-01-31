module AssetManifestHelper
  def manifest
    @manifest ||= Manifest.new
  end
  module_function :manifest

  class Manifest
    def asset_url(asset)
      url_for_path(asset_path(asset))
    end

    def style_url(bundle)
      url_for_path(style_path(bundle))
    end

    def script_url(bundle)
      url_for_path(script_path(bundle))
    end

    def asset_path(asset)
      configuration.asset_manifest.fetch(asset, asset)
    end

    def style_path(bundle)
      configuration.bundle_manifest.fetch(bundle, {})['css']
    end

    def script_path(bundle)
      configuration.bundle_manifest.fetch(bundle, {})['js']
    end

    def url_for_path(path)
      return nil unless path
      separator = path.start_with?('/') ? '' : '/'
      "#{asset_root_url}#{separator}#{path}"
    end

    def asset_root_url
      "#{asset_protocol}//#{configuration.domain}"
    end

    def asset_protocol
      if configuration.protocol
       "#{configuration.protocol}:"
      end
    end

    def configuration
      AssetManifestHelper.configuration
    end
  end
end
