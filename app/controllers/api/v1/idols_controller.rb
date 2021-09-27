module Api
  module V1
    class IdolsController < ApiController
      def index
        idols = Idol.all
        render json: idols, each_serializer: Api::V1::IdolSerializer
      end
    end
  end
end