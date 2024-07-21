class TastingNote < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  validate :user_must_be_expert 

  private

  def user_must_be_expert
    unless user&.expert?
      errors.add(:user, 'must be an expert to create a tasting note')
    end
  end
end
