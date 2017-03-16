class Customer < User
  authenticates_with_sorcery!
  default_scope {where(role: 'customer')}
  has_one :cart
end
