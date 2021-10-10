module Api
  module V1
    class IdolsController < ApiController
      def index
        idols = Idol.all
        render json: idols, each_serializer: Api::V1::IdolSerializer
      end

      def show
        idols = Idol.find(params[:id])
        render json: idols, serializer: Api::V1::IdolSerializer
      end
    end
  end
end