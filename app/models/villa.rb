class Villa < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :villa_name, :villa_location, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_many :favourites
  has_many :bookings

end
