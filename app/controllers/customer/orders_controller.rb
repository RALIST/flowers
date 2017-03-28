class Customer::OrdersController < Customer::CustomerController

  def create
    @checkout = Checkout.find(params[:id])
    @order = Order.create
    @order.checkout = @checkout
    @order.total = @checkout.cart.total_price
    if current_user
      @order.user = current_user
    end
    if @order.save
      @checkout.cart.positions.each do |p|
        @order.positions.push(p)
        @checkout.cart.positions.delete(p)
      end
      redirect_to products_path
      flash[:success] = 'Спасибо за заказ!'
    end
  end
end
