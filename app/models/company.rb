class Company < ApplicationRecord
  require 'action_view'
  include ActionView::Helpers::DateHelper

  belongs_to :owner, class_name: 'Florist', foreign_key: 'owner_id'
  has_one :image, as: :imageable
  has_many :products, dependent: :destroy
  has_many :comments, as: :commentable
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :image, :address

  ratyrate_rateable "delivery_speed", "flowers_quality", "price"

  validates :name, :address,
            :owner_id, :opened_at,
            :closed_at, presence: true

  def total_rating
    rating = Rate.where(rateable: self).pluck(:stars)
    if rating.size > 0
      return (rating.sum / rating.size).round(2)
    else
      return 0
    end
  end

  def to_param
    [id, self.name.parameterize].join('-')
  end

  def opened_interval
    if Time.current.hour < opened_at.in_time_zone.hour || Time.current.hour > closed_at.in_time_zone.hour
      return 'Сейчас закрыто'
    else
      if (closed_at - opened_at) == 0
        return 'Крулосуточно'
      else
        return "До закрытия #{distance_of_time_in_words((closed_at.utc.strftime('%H:%M').to_time - Time.current.utc.strftime('%H:%M').to_time))}"
      end
    end
  end
end
