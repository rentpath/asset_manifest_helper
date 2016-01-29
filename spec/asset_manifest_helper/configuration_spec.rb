require_relative '../../lib/asset_manifest_helper'

describe AssetManifestHelper.configuration do
  let(:sample_asset_manifest) { { 'foo.png' => '/assets/foo-fingerprint.png' } }
  let(:sample_bundle_manifest) { { 'main' => { 'js' => '/assets/main-bundle.js', 'css' => '/assets/main-bundle.css' } } }

  before(:each) do
    AssetManifestHelper.reset_configuration
  end

  describe '.asset_manifest' do
    it 'returns empty hash when asset_file missing' do
      expect(AssetManifestHelper.configuration.asset_manifest).to eql({})
    end

    it 'returns data from asset_file when present' do
      AssetManifestHelper.configure do |config|
        config.asset_file = 'spec/fixtures/assets.json'
      end
      expect(AssetManifestHelper.configuration.asset_manifest).to eql(sample_asset_manifest)
    end

    context 'cache is disabled (default)' do
      it 'loads the asset_file each time' do
        expect(AssetManifestHelper.configuration.asset_manifest).to eql({})
        AssetManifestHelper.configure do |config|
          config.asset_file = 'spec/fixtures/assets.json'
        end
        expect(AssetManifestHelper.configuration.asset_manifest).to eql(sample_asset_manifest)
      end
    end

    context 'cache is enabled' do
      it 'loads the asset_file once' do
        AssetManifestHelper.configure do |config|
          config.cache = true
        end
        expect(AssetManifestHelper.configuration.asset_manifest).to eql({})

        AssetManifestHelper.configure do |config|
          config.asset_file = 'spec/fixtures/assets.json'
        end
        expect(AssetManifestHelper.configuration.asset_manifest).to eql({})
      end
    end
  end

  describe '.bundle_manifest' do
    it 'returns empty hash when bundle_file missing' do
      expect(AssetManifestHelper.configuration.bundle_manifest).to eql({})
    end

    it 'returns data from bundle_file when present' do
      AssetManifestHelper.configure do |config|
        config.bundle_file = 'spec/fixtures/bundles.json'
      end
      expect(AssetManifestHelper.configuration.bundle_manifest).to eql(sample_bundle_manifest)
    end

    context 'cache is disabled (default)' do
      it 'loads the bundle_file each time' do
        expect(AssetManifestHelper.configuration.bundle_manifest).to eql({})
        AssetManifestHelper.configure do |config|
          config.bundle_file = 'spec/fixtures/bundles.json'
        end
        expect(AssetManifestHelper.configuration.bundle_manifest).to eql(sample_bundle_manifest)
      end
    end

    context 'cache is enabled' do
      it 'loads the bundle_file once' do
        AssetManifestHelper.configure do |config|
          config.cache = true
        end
        expect(AssetManifestHelper.configuration.bundle_manifest).to eql({})

        AssetManifestHelper.configure do |config|
          config.bundle_file = 'spec/fixtures/bundles.json'
        end
        expect(AssetManifestHelper.configuration.bundle_manifest).to eql({})
      end
    end
  end
end
