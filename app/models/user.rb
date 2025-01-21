class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :villas
  has_many :favourites
  has_many :bookings
  has_many :booking_requests, through: :villas, source: :bookings
end
