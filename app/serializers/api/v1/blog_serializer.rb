module Api
  module V1
    class BlogSerializer < ActiveModel::Serializer
      attributes :id, :idol_id, :title, :piece_title, :outline, :piece_release_on, :created_at
      attribute :thumbnail
      attribute(:genre_list) { object.genre_list }
      attribute(:distributor_list) { object.distributor_list}

      belongs_to :idol

      def thumbnail
        if Rails.env.production?
          object.thumbnail.thumb.url
        else
          Settings.app.base_url + object.thumbnail.thumb.url
        end
      end
    end
  end
end
