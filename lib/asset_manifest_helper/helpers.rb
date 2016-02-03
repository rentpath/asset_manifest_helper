module AssetManifestHelper
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
    AssetManifestHelper.configuration.asset_manifest.fetch(asset, asset)
  end

  def style_path(bundle)
    AssetManifestHelper.configuration.bundle_manifest.fetch(bundle, {})['css']
  end

  def script_path(bundle)
    AssetManifestHelper.configuration.bundle_manifest.fetch(bundle, {})['js']
  end

  def url_for_path(path)
    return nil unless path
    separator = path.start_with?('/') ? '' : '/'
    "#{asset_root_url}#{separator}#{path}"
  end

  def asset_root_url
    "#{AssetManifestHelper.configuration.protocol}://#{AssetManifestHelper.configuration.domain}"
  end
end
