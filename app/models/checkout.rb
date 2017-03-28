class Checkout < ApplicationRecord
  belongs_to :cart
  belongs_to :card
  belongs_to :address
  belongs_to :sender
  belongs_to :receiver

  accepts_nested_attributes_for :card
  accepts_nested_attributes_for :sender
  accepts_nested_attributes_for :receiver
  accepts_nested_attributes_for :address

end
