class Customer::PositionsController < Customer::CustomerController

  def create
    @product = Product.find(params[:id])
    if current_cart.positions.create!(product: @product)
      redirect_to my_cart_path
    end
  end
end
