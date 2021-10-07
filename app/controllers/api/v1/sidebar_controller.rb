module Api
  module V1
    class SidebarController < ApiController
      def index
        idols = Idol.all
        genre_list = Blog.where(published: true).tags_on(:genres)
        distributor_list = Blog.where(published: true).tags_on(:distributors)

        serialized_idols = ActiveModelSerializers::SerializableResource.new(idols, each_serializer: Api::V1::IdolSerializer)
        serialized_genre_list = ActiveModelSerializers::SerializableResource.new(genre_list, each_serializer: Api::V1::TagSerializer)
        serialized_distributor_list = ActiveModelSerializers::SerializableResource.new(distributor_list, each_serializer: Api::V1::TagSerializer)

        render json: {
          sidebar: {
            idols: serialized_idols,
            genreList: serialized_genre_list,
            distributorList: serialized_distributor_list,
          }
        }
      end
    end
  end
end