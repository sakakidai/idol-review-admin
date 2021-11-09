require 'pagy/extras/metadata'
module Api
  module V1
    class BlogsController < ApiController
      before_action :set_blogs, only: %i[index show]
      before_action :set_blog, only: %i[show]

      def index
        blogs = params[:tag].blank? ? @blogs : @blogs.tagged_with(params[:tag])
        pagy, blogs = pagy(blogs, page: params[[:page]])
        serialized_blogs = ActiveModelSerializers::SerializableResource.new(blogs, each_serializer: Api::V1::BlogSerializer)
        render json: {
          blogs: serialized_blogs,
          pagination: {
            currentPage: pagy.page,
            totalCount: pagy.count,
            totalPages: pagy.pages,
          }
        }
      end

      def show
        render json: @blog, serializer: Api::V1::BlogSerializer
      end

      private
      def set_blogs
        @blogs = Blog.where(published: true).all.order(id: :desc)
      end

      def set_blog
        @blog = @blogs.find(params[:id])
      end
    end
  end
end