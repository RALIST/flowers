class Customer::SessionsController < ApplicationController
  def new
    @user = Customer.new
  end

  def create
    if @user = login(params[:email], params[:password])
      remember_me!
      redirect_to root_path
      flash[:success] = 'Вы вошли!'
    else
      flash[:danger] = 'Не удалось войти! Проверьте введенные данные'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:success] =  'Вы вышли'
  end
end
