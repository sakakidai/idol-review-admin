module Api
  module V1
    class BlogsController < ApiController
      before_action :set_blog, only: %i[ show ]

      def index
        blogs = params[:tag].blank? ? Blog.all : Blog.tagged_with(params[:tag])
        idols = Idol.all
        genre_list = Blog.tags_on(:genres)
        distributor_list = Blog.tags_on(:distributors)

        # include: [:idol, :content_images] は省略
        serialized_blogs = ActiveModelSerializers::SerializableResource.new(blogs, each_serializer: Api::V1::BlogSerializer, template: 'index')
        serialized_idols = ActiveModelSerializers::SerializableResource.new(idols, each_serializer: Api::V1::IdolSerializer)

        render json: {
          blogs: serialized_blogs,
          idols: serialized_idols,
          genre_list: genre_list,
          distributor_list: distributor_list,
        }
      end

      def show
        genre_list = Blog.tags_on(:genres)
        distributor_list = Blog.tags_on(:distributors)

        # include: [:idol, :content_images] は省略
        serialized_blog = ActiveModelSerializers::SerializableResource.new(@blog, serializer: Api::V1::BlogSerializer, template: 'show')

        render json: {
          blog: serialized_blog,
          genre_list: genre_list,
          distributor_list: distributor_list,
        }
      end

      private
      def set_blog
        @blog = Blog.find(params[:id])
      end
    end
  end
end