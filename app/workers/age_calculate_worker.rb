class AgeCalculateWorker
  include Sidekiq::Worker

  def perform
    Idol.all.each { |idol| idol.update_age }
  end
end
