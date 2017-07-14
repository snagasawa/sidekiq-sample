class UserMailerJob < ApplicationJob
  queue_as :default

  def perform(id)
    user = User.find(id)
    user.send_welcome_email
  end
end
