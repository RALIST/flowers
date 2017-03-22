class Position < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :balloon
end
