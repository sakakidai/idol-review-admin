module Api
  module V1
    class DistributorSerializer < ActiveModel::Serializer
      attributes :id, :name, :url

      belongs_to :blogs
    end
  end
end