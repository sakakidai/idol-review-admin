class Admin::ApplicationMailer < ActionMailer::Base
  default to: Rails.application.credentials.gmail[:user_name]
  layout 'mailer'
end