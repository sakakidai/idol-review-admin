class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "uploads/cache/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    Settings.app.base_url + '/images/noimage.png'
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  def content_type_allowlist
    [/image\//]
  end
end