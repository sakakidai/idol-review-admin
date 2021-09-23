class Idol < ApplicationRecord
  mount_uploader :image, IdolImageUploader

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :comment, presence: true
  validates :image, presence: true

  before_create :set_calculate_age

  def set_calculate_age
    self.age = (Date.today.strftime('%Y%m%d').to_i - birth_date.strftime('%Y%m%d').to_i) / 10000
  end

  def update_age
    set_calculate_age
    save!
  end
end
