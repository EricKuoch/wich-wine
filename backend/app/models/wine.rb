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
    wine_attributes = attributes.slice("name", "region", "vineyard", "age").transform_keys(&:to_sym)
    alert_service = AlertWinesMatchService.new(wine_attributes)
    alert_service.send_notifications
  end

end

