class Blog < ApplicationRecord
  IMAGE_UPLOAD_LIMIT = 5

  after_save :publish_blogs_count

  mount_uploader :thumbnail, BlogThumbnailUploader
  mount_uploader :piece_image, BlogPieceImageUploader

  acts_as_taggable_on :genres, :distributors
  belongs_to :idol
  has_many :content_images, class_name: 'BlogContentImage', foreign_key: :blog_id, inverse_of: :blog
  accepts_nested_attributes_for :content_images, reject_if: :all_blank, allow_destroy: true
  has_many :distributors
  accepts_nested_attributes_for :distributors, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :piece_title, presence: true
  validates :outline, presence: true
  validates :thumbnail, presence: true
  validates :piece_release_on, presence: true
  validate :thumbnail_size
  validate :piece_image_size

  private
  def thumbnail_size
    if thumbnail.size > IMAGE_UPLOAD_LIMIT.megabytes
      errors.add(:thumbnail, "You cannot upload a file greater than #{IMAGE_UPLOAD_LIMIT}MB")
    end
  end

  def piece_image_size
    if piece_image.size > IMAGE_UPLOAD_LIMIT.megabytes
      errors.add(:piece_image, "You cannot upload a file greater than #{IMAGE_UPLOAD_LIMIT}MB")
    end
  end

  def publish_blogs_count
    idol.update!(publish_blogs_count: idol.blogs.where(published: true).size)
  end
end
