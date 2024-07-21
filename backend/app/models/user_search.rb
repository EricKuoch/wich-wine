class UserSearch < ApplicationRecord
  belongs_to :user

  scope :search_by_criteria, -> (criteria) { where(construct_criteria_query(criteria)) }
  
  private

  def self.construct_criteria_query(criteria)
    criteria.map do |key, value|
      value.present? ? "search_criteria->>'#{key}' LIKE '#{value}'" : nil
    end.compact.join(' OR ') 
  end

end
