module Api
  module V1
    class SidebarController < ApiController
      def index
        idols = Idol.having_blogs
        genre_list = Blog.where(published: true).tags_on(:genres)
        sale_list = Blog.where(published: true).tags_on(:sales)

        serialized_idols = ActiveModelSerializers::SerializableResource.new(idols, each_serializer: Api::V1::IdolSerializer)
        serialized_genre_list = ActiveModelSerializers::SerializableResource.new(genre_list, each_serializer: Api::V1::TagSerializer)
        serialized_sale_list = ActiveModelSerializers::SerializableResource.new(sale_list, each_serializer: Api::V1::TagSerializer)

        render json: {
          sidebar: {
            idols: serialized_idols,
            genreList: serialized_genre_list,
            saleList: serialized_sale_list,
          }
        }
      end
    end
  end
end