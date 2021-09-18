class Blog < ApplicationRecord
  validates :title, presence: true
  validates :piece_title, presence: true
  validates :outline, presence: true
end
