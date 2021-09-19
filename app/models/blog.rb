class Blog < ApplicationRecord
  mount_uploader :thumbnail, BlogThumbnailUploader

  validates :title, presence: true
  validates :piece_title, presence: true
  validates :outline, presence: true
end
