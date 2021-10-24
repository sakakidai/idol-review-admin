CarrierWave.configure do |config|
  config.asset_host = Settings.aws.s3_url
  config.fog_provider = 'fog/aws'

  if Rails.env.production?
    config.fog_directory  = 'idol-review-production'
  else
    config.fog_directory  = 'idol-preview-development'
  end
  config.fog_public = true

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws.access_key_id,
    aws_secret_access_key: Settings.aws.secret_access_key,
    region: 'ap-northeast-1'
  }
  config.storage = :fog
  config.cache_storage = :file
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/