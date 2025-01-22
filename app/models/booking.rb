class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :villa

  validates :start_date, :end_date, presence: true
end
