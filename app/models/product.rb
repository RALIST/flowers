class Product < ApplicationRecord
  belongs_to :company
  has_many :images, as: :imageable
  has_and_belongs_to_many :colors

  accepts_nested_attributes_for :images

  PRICE_RANGE = {'До 1000 руб': '0-1000',
                  '1000-2000 руб.': '1000-2000',
                  '2000-3000 руб.': '2000-3000',
                  '3000-4500 руб.': '3000-4500',
                  '4500 руб. и выше': '4500-50000'}

  def self.color(color)
    joins(:colors).where(colors: {name: color})
  end

  def self.price_in(price)
    unless price.blank?
      puts price_range = price.split(/\-/)
      where(price: price_range[0]..price_range[1])
    end
  end

  def self.type
  end
end
