class ConvertWebpJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "START: AgeCalculateJob"
    BlogContentImage.find_each { |content_image| content_image.image.recreate_versions! if content_image.image }
    Blog.find_each do |blog|
      blog.thumbnail.recreate_versions! if blog.thumbnail
      blog.piece_image.recreate_versions! if blog.piece_image
    end
    Idol.find_each { |idol| idol.image.recreate_versions! if idol.image }
    Rails.logger.info "END: AgeCalculateJob"
  end
end