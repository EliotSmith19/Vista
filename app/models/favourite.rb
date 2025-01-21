class Favourite < ApplicationRecord
  belongs_to :villa
  belongs_to :user
end
