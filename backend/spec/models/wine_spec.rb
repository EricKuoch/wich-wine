require 'rails_helper'

RSpec.describe Wine, type: :model do
  let!(:website) { create(:website) }
  let!(:wine1) { create(:wine, name: 'Wine 1') }
  let!(:wine2) { create(:wine, name: 'Wine 2') }
  let!(:wine_price1) { create(:wine_price, price: 20.0, wine: wine1, website: website) }
  let!(:wine_price2) { create(:wine_price, price: 50.0, wine: wine2, website: website) }
  let!(:expert_user) { create(:user, role: :expert) }
  let!(:tasting_note1) { create(:tasting_note, note: 90, user: expert_user, wine: wine1) }
  let!(:tasting_note2) { create(:tasting_note, note: 80, user: expert_user, wine: wine2) }

  describe '.within_price_range' do
    it 'returns wines within the given price range' do
      expect(Wine.within_price_range(10, 30)).to include(wine1)
      expect(Wine.within_price_range(10, 30)).not_to include(wine2)
    end
  end

  describe '.ordered_by_expert_rating' do
    it 'returns wines ordered by average rating' do
      wines = Wine.ordered_by_expert_rating
      expect(wines.first).to eq(wine1)
      expect(wines.second).to eq(wine2)
    end
  end
end
