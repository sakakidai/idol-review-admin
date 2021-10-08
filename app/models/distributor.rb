class Distributor < ApplicationRecord
  belongs_to :blog

  validates :name, presence: true
  validates :url, presence: true
end
