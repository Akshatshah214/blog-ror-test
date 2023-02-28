# Preview all emails at http://localhost:3000/rails/mailers/send_notification_mailer
class SendNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_notification_mailer/create_notification
  def create_notification
    SendNotificationMailer.create_notification
  end

end
