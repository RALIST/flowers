class Customer::CheckoutsController < Customer::CustomerController
  def new
    @card = Card.new
    @address = Address.new
    @checkout = Checkout.new
    @user = current_user || User.new
  end
end
