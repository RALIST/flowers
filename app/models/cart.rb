class Cart < ApplicationRecord
  belongs_to :customer
  has_many :products, through: :positions
  has_many :balloons, through: :positions
  has_many :positions
  has_many :checkouts




  def total_price
    sum = 0
    self.positions.where.not(product_id: nil).each do |p|
      case p.price_type
      when 'simple'
        sum += p.product.price
      when 'premium'
        sum += p.product.premium_price
      when 'lux'
        sum += p.product.lux_price
      end
    end
    sum += self.balloons.map{ |p| p.price }.sum
    return sum
  end
end
