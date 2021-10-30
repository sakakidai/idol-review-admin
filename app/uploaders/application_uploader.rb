class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process convert: 'webp'

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "uploads/cache/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    Settings.app.base_url + '/images/noimage.webp'
  end

  def extension_allowlist
    %w(jpg jpeg png webp)
  end

  def content_type_allowlist
    [/image\//]
  end

  def url
    super.sub(/\.jpg|\.jpeg|\.png/, '.webp')
  end
end