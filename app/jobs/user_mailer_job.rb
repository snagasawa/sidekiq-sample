class UserMailerJob < ApplicationJob
  queue_as :default

  def perform(id, message)
    user = User.find(id)
    user.send_welcome_email(message)
  end
end
