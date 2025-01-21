class Villa < ApplicationRecord
  belongs_to :user
  has_many :favourites
  has_many :bookings
end
