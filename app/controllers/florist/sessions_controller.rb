class Florist::SessionsController < Florist::FloristController
  skip_before_action :have_to_auth

  def new
    @user = Florist.new
  end

  def create
    if user = Florist.find_by(email: params[:email])
      if @user = login(params[:email], params[:password])
        redirect_to root_path
        flash[:success] = 'Вы вошли!'
      else
        flash[:danger] = 'Не удалось войти! Проверьте введенные данные'
        render 'new'
      end
    else
      redirect_to root_path
      flash[:danger] = "Вход только для флористов! #{view_context.link_to 'Регистрация', florist_signin_path}".html_safe
    end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:success] =  'Вы вышли'
  end
end
