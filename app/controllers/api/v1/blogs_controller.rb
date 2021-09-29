module Api
  module V1
    class BlogsController < ApiController
      before_action :set_blog, only: %i[ show ]

      def index
        blogs = Blog.all
        render json: blogs, each_serializer: BlogSerializer, include: [:idol]
      end

      def show
        render json: @blog, serializer: BlogSerializer, include: [:idol, :content_images]
      end

      private
      def set_blog
        @blog = Blog.find(params[:id])
      end
    end
  end
end