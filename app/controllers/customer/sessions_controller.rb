class Customer::SessionsController < Customer::CustomerController
  def new
    @user = Customer.new
  end

  def create
    if @user = login(params[:email], params[:password])
      remember_me!
      redirect_back_or_to products_path
      flash[:success] = 'Вы вошли!'
    else
      flash[:danger] = 'Не удалось войти! Проверьте введенные данные'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_back fallback_location: root_path
    flash[:success] =  'Вы вышли'
  end
end
