module AssetManifestHelper
  class Railtie < Rails::Railtie
    initializer "asset_manifest_helper.action_view.add_asset_manifest_helpers" do
      ActionView::Base.send :include, AssetManifestHelper
    end
  end
end
