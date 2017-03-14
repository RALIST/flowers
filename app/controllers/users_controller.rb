class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path
      flash[:success] = 'Спасибо за регистрацию!'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end


  private

  def user_params
    params.require(:user).permit(:email, :phone, :name, :last_name,
                                  :address, :password, :password_confirmation)
  end
end
