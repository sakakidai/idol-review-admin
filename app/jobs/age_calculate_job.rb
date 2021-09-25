class AgeCalculateJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "START: AgeCalculateJob"
    Idol.all.each { |idol| idol.update_age }
    Rails.logger.info "END: AgeCalculateJob"
  end
end
