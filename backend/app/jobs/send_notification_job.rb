class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(notifications)
    notifications.each do |notif|
      p notif.message
      NotificationMailer.notification_email(notif.user, notif).deliver_now
      notif.update(status: 'sent')
    rescue StandardError => e
      p e  
      notif.update(status: 'failed')
    end
  end
end
