class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404

  def rescue404(exception = nil, messages = nil)
    render json: {errors: { message: '指定されてたページはみつかりません' }}, status: :not_found
  end
end