class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_notification.subject
  #
  def send_notification(user)
    @user = user

    mail to: @user.email,subject: "Thank you for sigining up on our site"
  end
end
