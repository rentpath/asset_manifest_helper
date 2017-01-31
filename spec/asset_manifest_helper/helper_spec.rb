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

  describe '#manifest' do
    it 'is included as a module function' do
      expect(AssetManifestHelper.manifest.class).to eql(manifest.class)
    end
  end

  describe '#manifest.asset_url' do
    context 'asset in manifest' do
      it 'returns url based on path from manifest' do
        expect(manifest.asset_url('foo.png')).to eql('http://example.com/assets/foo-fingerprint.png')
      end
    end
    context 'asset not in manifest' do
      it 'returns url based on bare asset' do
        expect(manifest.asset_url('unknown.png')).to eql('http://example.com/unknown.png')
      end
    end
  end

  describe '#manifest.style_url' do
    context 'bundle in manifest' do
      it 'returns url based on path from manifest' do
        expect(manifest.style_url('main')).to eql('http://example.com/assets/main-bundle.css')
      end
    end
    context 'bundle not in manifest' do
      it 'returns nil' do
        expect(manifest.style_url('unknown')).to eql(nil)
      end
    end
  end

  describe '#manifest.script_url' do
    context 'bundle in manifest' do
      it 'returns url based on path from manifest' do
        expect(manifest.script_url('main')).to eql('http://example.com/assets/main-bundle.js')
      end
    end
    context 'bundle not in manifest' do
      it 'returns nil' do
        expect(manifest.script_url('unknown')).to eql(nil)
      end
    end
  end

  describe '#manifest.asset_root_url' do
    it 'returns url based on configured protocol and domain' do
        expect(manifest.asset_root_url).to eql('http://example.com')
    end
  end

  describe '#manifest.asset_protocol' do
    it 'returns script url set to https' do
        AssetManifestHelper.configure do |config|
          config.protocol = "https"
        end
        expect(manifest.script_url('main')).to eql('https://example.com/assets/main-bundle.js')
    end
    it 'returns script url set to http' do
        AssetManifestHelper.configure do |config|
          config.protocol = 'http'
        end
        expect(manifest.script_url('main')).to eql('http://example.com/assets/main-bundle.js')
    end
  end
    it 'returns script url set to //' do
        AssetManifestHelper.configure do |config|
          config.protocol = false
        end
        expect(manifest.script_url('main')).to eql('//example.com/assets/main-bundle.js')
    end
end
