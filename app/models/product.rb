class Product < ApplicationRecord
  belongs_to :company
  has_many :images, as: :imageable

  accepts_nested_attributes_for :images
end
