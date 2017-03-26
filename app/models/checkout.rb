class Checkout < ApplicationRecord
  belongs_to :cart
  has_one :card
  has_one :address
  has_one :sender
  has_one :receiver

  accepts_nested_attributes_for :card, :address, :sender, :receiver
end
