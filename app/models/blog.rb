class Blog < ApplicationRecord
  IMAGE_UPLOAD_LIMIT = 5

  mount_uploader :thumbnail, BlogThumbnailUploader

  acts_as_taggable_on :genres, :distributors

  has_many :content_images, class_name: 'BlogContentImage', foreign_key: :blog_id, inverse_of: :blog
  accepts_nested_attributes_for :content_images, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :piece_title, presence: true
  validates :outline, presence: true
  validates :thumbnail, presence: true
  validate :thumbnail_size

  def thumbnail_size
    if thumbnail.size > IMAGE_UPLOAD_LIMIT.megabytes
      errors.add(:thumbnail, "You cannot upload a file greater than #{IMAGE_UPLOAD_LIMIT}MB")
    end
  end
end
