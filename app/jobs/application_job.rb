class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  # overwrite log config
  logfile_path = Rails.root.join("log/#{Rails.env}_#{ENV['HOSTNAME']}_job.log")
  logger = ActiveSupport::Logger.new(logfile_path)
  logger.formatter = Rails.logger.formatter
  logger.level = Rails.logger.level
  Rails.logger = logger
end
