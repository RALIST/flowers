class Customer::CompaniesController < Customer::CustomerController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  has_scope :color
  has_scope :price_in
  has_scope :type
  has_scope :occasion
  has_scope :opened

  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @comments = @company.comments
    @params = search_params
    @products = apply_scopes(@company.products).all
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def search_params
    params.permit(:color, :price_in, :type, :occasion, :date)
    end

    def company_params
      params.require(:company).permit(:name, :desc, :url)
    end
end
