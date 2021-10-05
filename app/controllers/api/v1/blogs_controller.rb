module Api
  module V1
    class BlogsController < ApiController
      before_action :set_blog, only: %i[ show ]

      def index
        blogs = params[:tag].blank? ? Blog.all : Blog.tagged_with(params[:tag])
        render json: blogs, each_serializer: Api::V1::BlogSerializer
      end

      def show
        genre_list = Blog.tags_on(:genres)
        distributor_list = Blog.tags_on(:distributors)

        # include: [:idol, :content_images] は省略
        serialized_blog = ActiveModelSerializers::SerializableResource.new(@blog, serializer: Api::V1::BlogSerializer, template: 'show')
        serialized_genre_list = ActiveModelSerializers::SerializableResource.new(genre_list, each_serializer: Api::V1::TagSerializer)
        serialized_distributor_list = ActiveModelSerializers::SerializableResource.new(distributor_list, each_serializer: Api::V1::TagSerializer)

        render json: {
          blog: serialized_blog,
          genreList: serialized_genre_list,
          distributorList: serialized_distributor_list,
        }
      end

      private
      def set_blog
        @blog = Blog.find(params[:id])
      end
    end
  end
end