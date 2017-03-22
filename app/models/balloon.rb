class Balloon < ApplicationRecord
  has_one :image, as: :imageable
  has_many :carts, through: :positions
  has_many :positions
end
