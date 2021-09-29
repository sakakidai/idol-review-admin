module Api
  module V1
    class BlogContentImageSerializer < ActiveModel::Serializer
      attributes :id, :blog_id, :comment
      attribute :image

      belongs_to :blog

      def image
        if Rails.env.production?
          object.thumbnail.thumb.url
        else
          Settings.app.base_url + object.image.thumb.url
        end
      end
    end
  end
end
