class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one :company, foreign_key: 'owner_id'
  enum gender: {'женщина': 1, 'мужчина': 2, 'другое': 3}

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true


  def full_name
    "#{name} #{last_name}"
  end
end
