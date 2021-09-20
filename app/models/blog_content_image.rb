class BlogContentImage < ApplicationRecord
  mount_uploader :image, BlogContentImageUploader

  belongs_to :blog

  validates :image, presence: true
end
