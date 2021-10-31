class Admin::InquiriesMailer < Admin::ApplicationMailer
  def notify
    @inquiry = Inquiry.find(params[:id])
    @subject = "#{@inquiry.last_name} #{@inquiry.first_name}様よりお問い合わせがありました"
  end
end