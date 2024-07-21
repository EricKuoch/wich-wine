class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notification_email(user, notification)
    @user = user
    @notification = notification
    mail(to: @user.email, subject: 'Un vin vous correspond !')
    rescue StandardError => e 
      p "Template à implémenter"
    end

end
