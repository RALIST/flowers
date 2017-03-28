class Order < ApplicationRecord
  belongs_to :checkout
  belongs_to :user
  has_many :products, through: :positions
  has_many :balloons, through: :positions
  has_many :positions
  has_one :sender, through: :checkout
  has_one :receiver, through: :checkout
  has_one :card, through: :checkout
  has_one :address, through: :checkout

  validates :checkout_id, :total, presence: true
end
