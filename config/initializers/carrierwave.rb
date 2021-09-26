CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: 'ap-northeast-1'
  }
  config.fog_directory  = 'digital-idol-dev'
  config.fog_public = false
  config.fog_authenticated_url_expiration = 60

  if Rails.env == "development"
    config.storage = :fog
    config.cache_storage = :file
  else
    config.storage = :fog
    config.cache_storage = :file
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/