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
  # Set paths to JSON manifest files. Defaults are in 'public/assets/'
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
All of the helper methods are accessed through a single method `#manifest`.
It acts as a sort of namespace.

```ruby
manifest.asset_url(asset)
```
Given an asset name (such as an image filename) returns the full url to the asset.
If no match in the manifest, returns full url in which the asset name is treated as the path.

```ruby
manifest.style_url(bundle)
```
Given a bundle name (such as "main") returns the full url to the CSS bundle.
If no match in the manifest, returns `nil`.

```ruby
manifest.script_url(bundle)
```
Given a bundle name (such as "main") returns the full url to the Javascript bundle.
If no match in the manifest, returns `nil`.

```ruby
manifest.asset_path(asset)
```
Given an asset name (such as an image filename) returns the path to the asset from the manifest file.
If no match in the manifest, returns `asset`.

```ruby
manifest.style_path(bundle)
```
Given a bundle name (such as "main") returns the path to the CSS bundle.
If no match in the manifest, returns `nil`.

```ruby
manifest.script_path(bundle)
```
Given a bundle name (such as "main") returns the path to the Javascript bundle.
If no match in the manifest, returns `nil`.
