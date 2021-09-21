class Blog < ApplicationRecord
  mount_uploader :thumbnail, BlogThumbnailUploader

  acts_as_taggable_on :tags

  has_many :content_images, class_name: 'BlogContentImage', foreign_key: :blog_id, inverse_of: :blog
  accepts_nested_attributes_for :content_images, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :piece_title, presence: true
  validates :outline, presence: true
  validates :thumbnail, presence: true
end
