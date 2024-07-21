class Wine < ApplicationRecord
  has_many :tasting_notes
  has_many :wine_prices
  has_many :websites, through: :wine_prices

  scope :within_price_range, ->(min_price, max_price) { joins(:wine_prices).where(wine_prices: { price: min_price..max_price })}
 
  scope :ordered_by_expert_rating, -> {
    joins(:tasting_notes) 
      .select('wines.*, AVG(tasting_notes.note) AS average_rating') 
      .group('wines.id')
      .order('average_rating DESC')
  }

  after_save :call_alert_match_service

  private

  def call_alert_match_service
    alert_service = AlertWinesMatchService.new(self)
    alert_service.create_notifications
    alert_service.send_notification
  end

end

