module Api
  module V1
    class BlogSerializer < ActiveModel::Serializer
      attributes :id, :idol_id, :title, :piece_title, :outline, :piece_release_on, :created_at
      attribute :thumbnail

      belongs_to :idol

      def thumbnail
        object.thumbnail.thumb.url
      end
    end
  end
end
