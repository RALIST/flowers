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
    case params[:checkout][:delivery]
    when 'self'
      @params = checkout_params.except(:receiver_attributes, :address_attributes, :call_receiver, :dont_call)
      @checkout = Checkout.create(@params)
    when 'send'
      if params[:checkout][:call_receiver]
        @params = checkout_params.except(:address_attributes)
        @checkout = Checkout.create(@params)
      end
    end
    @checkout.cart = current_cart
    if @checkout.save
      redirect_to checkout_path(@checkout)
    end
  end

  def show
    @checkout = Checkout.find(params[:id])
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
