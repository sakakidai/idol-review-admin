module Api
  module V1
    class BlogsController < ApiController
      before_action :set_blog, only: %i[ show ]

      def index
        blogs = params[:tag].blank? ? Blog.where(published: true).all.order(id: :desc) : Blog.where(published: true).tagged_with(params[:tag]).order(id: :desc)
        render json: blogs, each_serializer: Api::V1::BlogSerializer
      end

      def show
        render json: @blog, serializer: Api::V1::BlogSerializer
      end

      private
      def set_blog
        @blog = Blog.where(published: true).find(params[:id])
      end
    end
  end
end