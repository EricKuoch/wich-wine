require 'rails_helper'

RSpec.describe TastingNote, type: :model do
  let(:expert_user) { User.create(email: 'expert@example.com', password: 'password', role: :expert) }
  let(:regular_user) { User.create(email: 'user@example.com', password: 'password', role: :user) }
  let(:wine) { Wine.create(name: 'Chardonnay', age: 5, vineyard: 'Chateau de France', region: 'Burgundy', grape_variety: 'Chardonnay', alcohol_content: 13.5, description: 'A rich and full-bodied Chardonnay.') }

  context 'when user is an expert' do
    it 'allows creating a tasting note' do
      tasting_note = TastingNote.new(user: expert_user, wine: wine, note: 90, comment: 'Excellent wine!')
      expect(tasting_note).to be_valid
    end
  end

  context 'when user is not an expert' do
    it 'does not allow creating a tasting note' do
      tasting_note = TastingNote.new(user: regular_user, wine: wine, note: 80, comment: 'Taste sooo bad!')
      expect(tasting_note).not_to be_valid
      expect(tasting_note.errors[:user]).to include('must be an expert to create a tasting note')
    end
  end
end
