module Api
  module V1
    class BlogSerializer < ActiveModel::Serializer
      attributes :id, :idol_id, :title, :piece_title, :piece_release_on, :created_at
      attribute :thumbnail
      attribute :piece_image, if: -> {instance_options[:template] == 'show'}
      attribute :outline, if: -> {@instance_options[:template] == 'show'}
      attribute :shot_outline
      attribute(:genre_list) { object.genre_list }
      attribute(:distributor_list) { object.distributor_list}

      belongs_to :idol
      has_many :content_images, serializer: Api::V1::BlogContentImageSerializer
      has_many :distributors, if: -> { @instance_options[:template] == 'show' }

      def thumbnail
        if @instance_options[:template] == 'index'
          object.thumbnail.list_item.url
        else
          object.thumbnail.thumb.url
        end
      end

      def piece_image
        return if object.piece_image.file.nil?

        object.piece_image.thumb.url
      end

      def shot_outline
        object.outline.truncate(100, omission: '...続く')
      end
    end
  end
end
