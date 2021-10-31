module Api
  module V1
    class IdolsController < ApiController
      before_action :set_idols, only: %i[index show]

      def index
        idols = @idols.all
        render json: idols, each_serializer: Api::V1::IdolSerializer
      end

      def show
        idol = @idols.find(params[:id])
        render json: idol, serializer: Api::V1::IdolSerializer
      end

      private

      def set_idols
        @idols = Idol.having_blogs
      end
    end
  end
end