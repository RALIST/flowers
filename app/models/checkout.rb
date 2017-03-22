class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_one :card
  has_one :address
  has_one :user

  accepts_nested_attributes_for :card, :address, :user
end
