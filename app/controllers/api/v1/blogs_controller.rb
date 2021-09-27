module Api
  module V1
    class BlogsController < ApiController
      def index
        blogs = Blog.all
        render json: blogs, each_serializer: BlogSerializer, include: [:idol]
      end
    end
  end
end