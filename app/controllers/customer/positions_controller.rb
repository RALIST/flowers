class Customer::PositionsController < Customer::CustomerController

  def create
    if params[:balloon_id]
      @balloon = Balloon.find(params[:balloon_id])
      @position = current_cart.positions.create!(balloon: @balloon)
    else
      @product = Product.find(params[:id])
      @position = current_cart.positions.create!(product: @product)
      @position.price_type = position_params[:price_option]
    end
    if @position.save
      redirect_to my_cart_path
    end
  end

  def destroy
    @position = Position.find(params[:id])
    if @position.destroy
      unless current_cart.positions.blank?
        redirect_back fallback_location: products_path
      else
        redirect_to products_path
      end
    end
  end

  def position_params
    params.permit(:price_option)
  end
end
