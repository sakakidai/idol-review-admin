module Sidekiq
  class Logger < ::Logger
    module Formatters
      class ExtraPretty < Base
        def call(severity, time, program_name, message)
          format = "[%s pid=%d tid=%s%s] [%s]: %s\n"
          format % [format_datetime(time), $$, tid, format_context, severity, message]
        end
      end
    end
  end
end

# server(sidekiqプロセス)
Sidekiq.configure_server do |config|
  config.logger.formatter = Sidekiq::Logger::Formatters::ExtraPretty.new
  config.redis = { url: "redis://#{Settings.sidekiq.redis_host}:#{Settings.sidekiq.redis_port}/0" }
end

# client(perform_laterを叩く場所)
Sidekiq.configure_client do |config|
  config.logger.formatter = Sidekiq::Logger::Formatters::ExtraPretty.new
  config.redis = { url: "redis://#{Settings.sidekiq.redis_host}:#{Settings.sidekiq.redis_port}/0" }
end