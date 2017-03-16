class Company < ApplicationRecord
  belongs_to :owner, class_name: 'Florist', foreign_key: 'owner_id'
  has_one :image, as: :imageable
  has_many :products

  accepts_nested_attributes_for :image
end
