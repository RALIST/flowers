module UserConstraint
  def current_user(request)
    User.find_by_id(request.session[:user_id])
  end
end

class NoUserRequiredConstraint
  include UserConstraint

  def matches?(request)
    !current_user(request).present?
  end
end

class CustomerConstraint
  include UserConstraint

  def matches?(request)
    user = current_user(request)
    user.present? && user.role == 'customer'
  end
end

class FloristConstraint
  include UserConstraint

  def matches?(request)
    user = current_user(request)
    user.present? && user.role == 'florist'
  end
end
