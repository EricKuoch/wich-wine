class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, [:user, :expert, :admin ]
         
  has_many :user_searches
  has_many :tasting_notes
  has_many :notifications
end
