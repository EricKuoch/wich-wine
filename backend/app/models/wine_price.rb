class WinePrice < ApplicationRecord
  belongs_to :website
  belongs_to :wine
end
