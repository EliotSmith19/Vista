class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :villa
  has_many :reviews

  validates :start_date, :end_date, presence: true
  

  # def owner
  #   villa.user
  # end
end
