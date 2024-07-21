
class AlertWinesMatchService
  def initialize(wine)
    @criteria = 
    { name:wine.name, region:wine.region, vineyard:wine.vineyard, age:wine.age }
    @user_searches = UserSearch.search_by_criteria(@criteria)
    @wine = wine
    @notifications = []
  end

  def create_notifications
    if @user_searches.present?
      user_ids = @user_searches.pluck(:user_id).uniq
      user_ids.each do |user_id|
        user = User.find(user_id)
        message =  "Bonjour, #{user.email}, ce vin '#{@wine.name}' correspond à vos recherches" 
        @notifications << Notification.create(user:, message:, status: 'pending')
      end
    end
  end

  def send_notification = SendNotificationJob.perform_now(@notifications)
  
end
