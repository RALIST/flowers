class Florist::CompaniesController < Florist::FloristController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @company = current_user.company
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    unless current_user.company
      @company = Company.new
      @company.build_address
    else
      redirect_to florist_companies_path
      flash[:danger] = 'Вы уже зарегистрировали компанию'
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_user.create_company(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to florist_companies_path, success: 'Company was successfully created.' }
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
      format.html { redirect_to florist_account_path, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :desc, :url,
                    :owner_id, :closed_at,
                    :opened_at,
                    :fb_url, :vk_url, :insta_url, :id,
                    image_attributes:[:pic],
                    address_attributes:[:street, :house, :flat])
    end
end
