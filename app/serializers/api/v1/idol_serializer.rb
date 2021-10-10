module Api
  module V1
    class IdolSerializer < ActiveModel::Serializer
      attributes :id, :name, :comment, :age, :publish_blogs_count
      attribute :image

      has_many :blogs, if: -> {@instance_options[:template] == 'show'}

      def image
        if Rails.env.production?
          object.image.thumb.url
        else
          Settings.app.base_url + object.image.thumb.url
        end
      end
    end
  end
end
