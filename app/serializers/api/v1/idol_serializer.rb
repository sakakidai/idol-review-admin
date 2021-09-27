module Api
  module V1
    class IdolSerializer < ActiveModel::Serializer
      attributes :id, :name, :image, :birth_date, :comment, :age

      has_many :blogs
    end
  end
end
