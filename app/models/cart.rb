class Cart < ApplicationRecord
  belongs_to :customer
  has_many :products, through: :positions
  has_many :positions
end
