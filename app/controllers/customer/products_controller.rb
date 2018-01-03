class Customer::ProductsController < Customer::CustomerController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  has_scope :color
  has_scope :price_in
  has_scope :type
  has_scope :occasion
  has_scope :opened

  def index
    @params = search_params
    if @params.blank?
      @products = Product.all
    else
      @products = apply_scopes(Product).all
    end
    set_meta_tags title: 'Доставка цветов и букетов в Ижевске',
                  site: 'FlowBoom.ru',
                  reverse: true
  end

  def show
  end

  def search_params
    params.permit(:color, :price_in, :type, :occasion, :opened)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :price, :order_count, :views_count)
    end
end
