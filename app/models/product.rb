class Product < ApplicationRecord
  belongs_to :company
  has_many :images, as: :imageable
  has_and_belongs_to_many :colors

  accepts_nested_attributes_for :images, :colors
end
