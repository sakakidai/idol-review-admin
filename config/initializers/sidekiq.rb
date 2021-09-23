Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{Settings.sidekiq.redis_host}:#{Settings.sidekiq.redis_port}/0" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{Settings.sidekiq.redis_host}:#{Settings.sidekiq.redis_port}/0" }
end