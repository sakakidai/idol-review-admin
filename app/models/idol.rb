class Idol < ApplicationRecord
  IMAGE_UPLOAD_LIMIT = 5

  mount_uploader :image, IdolImageUploader

  has_many :blogs

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :comment, presence: true
  validates :image, presence: true
  validate :image_size

  before_save :set_calculate_age, if: -> {will_save_change_to_attribute?("birth_date")}

  def set_calculate_age
    return if birth_date.blank?
    self.age = (Date.today.strftime('%Y%m%d').to_i - birth_date.strftime('%Y%m%d').to_i) / 10000
  end

  def update_age
    set_calculate_age
    save!
  end

  def image_size
    if image.size > IMAGE_UPLOAD_LIMIT.megabytes
      errors.add(:image, "You cannot upload a file greater than #{IMAGE_UPLOAD_LIMIT}MB")
    end
  end
end
