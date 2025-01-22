class Villa < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :favourites

  has_one_attached :photo

  validates :villa_name, :villa_location, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

end
