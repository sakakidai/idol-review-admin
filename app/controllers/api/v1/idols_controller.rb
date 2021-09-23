module Api
  module V1
    class IdolsController < ApiController
      def index
        idols = Idol.all
        render json: {status: 'SUCCESS', data: idols}, status: :ok
      end
    end
  end
end