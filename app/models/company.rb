class Company < ApplicationRecord
  belongs_to :owner, class_name: 'Florist', foreign_key: 'owner_id'
  has_one :image, as: :imageable
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :image

  ratyrate_rateable "delivery_speed", "flowers_quality", "price"



  def total_rating
    rating = Rate.where(rateable: self).pluck(:stars)
    return (rating.sum / rating.size).round(2)
  end
end
