# asset_manifest_helper
Rails and Sinatra helpers for generating asset URLs from a JSON manifest

## Usage

### Require the gem
```ruby
require 'asset_manifest_helper'
```

### Configuration:
```ruby
AssetManifestHelper.configure do |config|
  # Set paths to JSON manifest files.
  config.asset_file = 'path/to/webpack-assets.json'
  config.bundle_file = 'path/to/webpack-bundles.json'

  # Set protocol and domain for asset server.
  config.protocol = 'http'
  config.domain = 'www.example.com'

  # Set to true in production to avoid reloading JSON manifest files.
  # Set to false (the default) in development to pick up changes to manifest files.
  config.cache = false
end
```

### Helper methods:
```ruby
asset_url(asset)
```
Given an asset name (such as an image filename) returns the full url to the asset.
If no match in the manifest, returns full url in which the asset name is treated as the path.

```ruby
style_url(bundle)
```
Given a bundle name (such as "main") returns the full url to the CSS bundle.
If no match in the manifest, returns `nil`.

```ruby
script_url(bundle)
```
Given a bundle name (such as "main") returns the full url to the Javascript bundle.
If no match in the manifest, returns `nil`.
