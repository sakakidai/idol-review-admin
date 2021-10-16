CarrierWave.configure do |config|
  config.asset_host = Settings.app.base_url
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'idol-review-production'
  config.fog_public = false
  config.fog_authenticated_url_expiration = 60

  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Settings.aws.access_key_id,
      aws_secret_access_key: Settings.aws.secret_access_key,
      region: 'ap-northeast-1'
    }
    config.storage = :fog
    config.cache_storage = :file
  else
    config.storage = :file
    config.cache_storage = :file
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/