class User < ApplicationRecord
  def send_welcome_email(message)
    if message.length <= 10
      begin
        raise(RuntimeError) if message.length < 10
        UserMailer.welcome_email(self, message).deliver_now
      rescue => e
        UserMailerJob.set(wait: 10.seconds).perform_later(id, 'retry mail')
      end
    else
      message.scan(/.{1,10}/).each do |splitted_msg|
        UserMailerJob.perform_later(id, splitted_msg)
      end
    end
  end
end
