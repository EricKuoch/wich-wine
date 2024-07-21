class Notification < ApplicationRecord
  belongs_to :user
  enum status: { pending: 'pending', sent: 'sent', failed: 'failed', read: 'read'}

end
