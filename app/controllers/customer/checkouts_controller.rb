class Customer::CheckoutsController < Customer::CustomerController
  def new
    @card = Card.new
    @address = Address.new
    @checkout = Checkout.new
    @user = Sender.new
    @receiver = Receiver.new
  end

  def create
    @checkout = Checkout.create
  end
end
