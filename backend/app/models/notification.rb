class Notification < ApplicationRecord
  belongs_to :user
  enum :status, [ :pending, :sent, :read ]

end
