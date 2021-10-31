class Admin::ApplicationMailer < ActionMailer::Base
  default to: 'noreply@idol-review.com'
  layout 'mailer'
end