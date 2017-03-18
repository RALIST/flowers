class Customer::UsersController < Customer::CustomerController
  def new
    @user = Customer.new
  end

  def create
    @user = Customer.create(user_params)
    if @user.save
      auto_login(@user)
      remember_me!
      redirect_to root_path
      flash[:success] = 'Спасибо за регистрацию!'
    else
      render 'new'
    end
  end

  def show

  end

  def edit
    @user = Customer.find(session[:user_id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_back fallback_location: root_path
  end


  private

  def user_params
    params.require(:customer).permit(:email, :phone, :name, :last_name,
                                   :password, :password_confirmation, :gender)
  end
end
