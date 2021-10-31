class Inquiry < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates :subject, presence: true, length: { maximum: 100 }
  calidates :content, presence: true, length: { maximum: 400 }
end
