class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email(user, message)
    @user = user
    @url  = 'http://example.com/login'
    @message = message
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
