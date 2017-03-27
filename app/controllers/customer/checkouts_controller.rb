class Customer::CheckoutsController < Customer::CustomerController
  def new
    @checkout = Checkout.new
    @card = @checkout.build_card
    @address = @checkout.build_address
    @user = @checkout.build_sender
    @receiver = @checkout.build_receiver
    @sender = @checkout.build_sender
  end

  def create
    @checkout = Checkout.create(checkout_params)
    @checkout.cart = current_cart
    if @checkout.save
      redirect_to my_cart_path
    end
  end

  private
    def checkout_params
      params.require(:checkout).permit(
                    :delivery,
                    :order_date,
                    :order_time,
                    :call_receiver,
                    :dont_call,
                    card_attributes: [:desc],
                    sender_attributes: [:name, :phone],
                    receiver_attributes: [:name, :phone],
                    address_attributes: [:street, :house, :flat])
    end
end
