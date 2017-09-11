class Florist < User
  authenticates_with_sorcery!
  has_one :company, foreign_key: 'owner_id'
  has_many :products, through: :company
  validates :name, :email, presence: true
  validates :email, :phone, uniqueness: true

  accepts_nested_attributes_for :company

  default_scope {where(role: 'florist')}




  private
  def set_role
    self.role = 'florist'
  end

end
