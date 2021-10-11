module Api
  module V1
    class BlogContentImageSerializer < ActiveModel::Serializer
      attributes :id, :blog_id, :comment
      attribute :image

      belongs_to :blog

      def image
        object.image.thumb.url
      end
    end
  end
end
