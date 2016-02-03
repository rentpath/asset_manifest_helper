require_relative '../../lib/asset_manifest_helper'
include AssetManifestHelper

describe AssetManifestHelper do
  before(:each) do
    AssetManifestHelper.reset_configuration
    AssetManifestHelper.configure do |config|
      config.asset_file = 'spec/fixtures/assets.json'
      config.bundle_file = 'spec/fixtures/bundles.json'
    end
  end

  describe '#asset_url' do
    context 'asset in manifest' do
      it 'returns url based on path from manifest' do
        expect(AssetManifestHelper.asset_url('foo.png')).to eql('http://example.com/assets/foo-fingerprint.png')
      end
    end
    context 'asset not in manifest' do
      it 'returns url based on bare asset' do
        expect(AssetManifestHelper.asset_url('unknown.png')).to eql('http://example.com/unknown.png')
      end
    end
  end

  describe '#style_url' do
    context 'bundle in manifest' do
      it 'returns url based on path from manifest' do
        expect(AssetManifestHelper.style_url('main')).to eql('http://example.com/assets/main-bundle.css')
      end
    end
    context 'bundle not in manifest' do
      it 'returns nil' do
        expect(AssetManifestHelper.style_url('unknown')).to eql(nil)
      end
    end
  end

  describe '#script_url' do
    context 'bundle in manifest' do
      it 'returns url based on path from manifest' do
        expect(AssetManifestHelper.script_url('main')).to eql('http://example.com/assets/main-bundle.js')
      end
    end
    context 'bundle not in manifest' do
      it 'returns nil' do
        expect(AssetManifestHelper.script_url('unknown')).to eql(nil)
      end
    end
  end

  describe '#asset_root_url' do
    it 'returns url based on configured protocol and domain' do
        expect(AssetManifestHelper.asset_root_url).to eql('http://example.com')
    end
  end
end
