class Product < ApplicationRecord
  belongs_to :company
  has_many :images, as: :imageable
  has_many :carts, through: :positions
  has_many :positions
  has_and_belongs_to_many :colors
  has_and_belongs_to_many :types
  has_and_belongs_to_many :occasions, autosave: true

  validates :name, :price, :images, presence: true

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['pic'].blank? }
  accepts_nested_attributes_for :occasions

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

  def self.type(type)
    joins(:types).where(types: {name: type})
  end

  def self.occasion(occasion)
    joins(:occasions).where(occasions: {name: occasion})
  end

  def occasion_name
    self.occasions.each do |o|
      return o.name
    end
  end

  def occasion_name=(name)
    unless name.blank?
      name = name.strip.downcase
      occasion = Occasion.find_or_create_by!(name: name)
      self.occasions << occasion
    end
  end

end
