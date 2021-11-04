module Api
  module V1
    class InquiriesController < ApiController
      def create
        @inquiry = Inquiry.new(inquiry_params)
        if @inquiry.save
          Admin::InquiriesMailer.with(id: @inquiry.id).notify.deliver_later
          render json: {message: 'メールを送信しました。'}, status: :ok
        else
          render json: { errors: @inquiry.errors.messages }, status: :bad_request
        end
      end

      private

      def inquiry_params
        params.require(:inquiry).permit(:last_name, :first_name, :email, :subject, :content)
      end
    end
  end
end