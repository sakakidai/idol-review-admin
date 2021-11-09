class ApiController < ActionController::API
  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404

  def rescue404(exception = nil, messages = nil)
    render json: {message: '指定されてたページはみつかりません'}, status: :not_found
  end
end