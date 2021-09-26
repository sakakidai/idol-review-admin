class BlogContentImage < ApplicationRecord
  IMAGE_UPLOAD_LIMIT = 5

  mount_uploader :image, BlogContentImageUploader

  belongs_to :blog

  validates :image, presence: true
  validate :image_size

  def image_size
    if image.size > IMAGE_UPLOAD_LIMIT.megabytes
      errors.add(:image, "You cannot upload a file greater than #{IMAGE_UPLOAD_LIMIT}MB")
    end
  end
end
