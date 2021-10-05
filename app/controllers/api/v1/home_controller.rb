module Api
  module V1
    class HomeController < ApiController
      def index
        blogs = Blog.all
        idols = Idol.all
        genre_list = Blog.tags_on(:genres)
        distributor_list = Blog.tags_on(:distributors)

        # include: [:idol, :content_images] は省略
        serialized_blogs = ActiveModelSerializers::SerializableResource.new(blogs, each_serializer: Api::V1::BlogSerializer, template: 'index')
        serialized_idols = ActiveModelSerializers::SerializableResource.new(idols, each_serializer: Api::V1::IdolSerializer)
        serialized_genre_list = ActiveModelSerializers::SerializableResource.new(genre_list, each_serializer: Api::V1::TagSerializer)
        serialized_distributor_list = ActiveModelSerializers::SerializableResource.new(distributor_list, each_serializer: Api::V1::TagSerializer)

        render json: {
          blogs: serialized_blogs,
          idols: serialized_idols,
          genreList: serialized_genre_list,
          distributorList: serialized_distributor_list,
        }
      end
    end
  end
end