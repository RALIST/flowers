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
      @checkout.cart.products.each do |p|
        @order.products.push(p)
        @checkout.cart.products.delete(p)
      end
      @checkout.cart.balloons.each do |p|
        @order.balloons.push(p)
        @checkout.cart.balloons.delete(p)
      end
      redirect_to products_path
      flash[:success] = 'Спасибо за заказ!'
    end
  end
end
