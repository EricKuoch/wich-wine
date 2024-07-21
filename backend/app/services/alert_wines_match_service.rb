class AlertWinesMatchService

  def initialize(wine_attributes)
    @user_searches = UserSearch.search_by(wine_attributes)
    @wine_attributes = wine_attributes
    @notifications = []
  end

  def send_notifications
    create_notifications if @user_searches.present?
    SendNotificationJob.perform_now(@notifications) unless @notifications.empty?
  end

  def create_notifications
    user_ids = @user_searches.pluck(:user_id).uniq
    user_ids.each do |user_id|
      user = User.find(user_id)
      message =  "Bonjour, #{user.name}, ce vin '#{@wine_attributes[:name]}' correspond à vos recherches" 
      @notifications << Notification.create(user:, message:, status: 'pending')
    end
  end
  
end
