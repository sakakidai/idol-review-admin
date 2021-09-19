class Idol < ApplicationRecord
  mount_uploader :image, IdolImageUploader

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :comment, presence: true
  validates :image, presence: true
end
