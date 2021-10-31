class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :block_foreign_hosts

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def whitelisted?(ip)
    Rails.logger.info('====================')
    Rails.logger.info(request.remote_ip)
    Rails.logger.info('====================')
    if ['172.18.0.1', ENV["MY_IP"]].include?(ip)
      return true
    else
      return false
    end
  end

  def block_foreign_hosts
    if whitelisted?(request.remote_ip)
      return false
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end
end
