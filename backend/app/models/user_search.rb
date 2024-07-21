class UserSearch < ApplicationRecord
  belongs_to :user

  scope :search_by_criteria, -> (criteria) { where(construct_criteria_query(criteria)) }
  scope :search_by, -> (attributes) { 
    where(construct_attributes_query(attributes), attributes)
  }

  private

  def self.construct_attributes_query(attributes)
    attributes.map { |key, value| "#{key} = :#{key}" }.join(' OR ')
  end

end
