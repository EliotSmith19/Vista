class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :villa
  has_many :reviews
  # def owner
  #   villa.user
  # end
end
