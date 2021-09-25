require_relative "boot"

# add require
require_relative "logger_formatter"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # ActiveSupport::TimeWithZone
    config.time_zone = 'Tokyo'

    # DB time zone
    config.active_record.default_timezone = :local

    # Set locale
    config.i18n.default_locale = :en

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
    end

    # Set log
    config.log_formatter = Logger::Formatter.new
    config.log_tags = [->(req){req.uuid.first(10)}, :remote_ip]
    config.paths['log'] = "log/#{Rails.env}_#{ENV['HOSTNAME']}_web.log"
    logger = ActiveSupport::Logger.new(config.paths['log'].first)
    logger.formatter = Logger::Formatter.new


    # Set adapter
    config.active_job.queue_adapter = :sidekiq
  end
end
