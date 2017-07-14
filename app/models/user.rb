class User < ApplicationRecord
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
