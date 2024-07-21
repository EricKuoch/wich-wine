class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(notifications)
    logger = Logger.new(STDOUT)
    notifications.each do |notif|
      logger.info notif.message
      NotificationMailer.notification_email(notif.user, notif).deliver_now
      notif.update(status: 'sent')
    rescue StandardError => e
      logger.error e
      notif.update(status: 'failed')
    end
  end
end
