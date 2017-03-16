class Florist::UsersController < Florist::FloristController
  skip_before_action :have_to_auth, only: [:new, :create]
  before_action :set_user, only: :update
  def new
    @user = Florist.new
  end

  def create
    @user = Florist.create(user_params)
    if @user.save
      auto_login(@user)
      remember_me!
      redirect_to florist_account_path
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
    if @user.update(user_params)
      redirect_back fallback_location: root_path
      flash[:success] = 'Информация обновлена!'
    end
  end


  private

  def user_params
    params.require(:florist).permit(:email, :phone, :name, :last_name,
                                  :address, :password, :password_confirmation, :gender)
  end

  def set_user
    @user = Florist.find(current_user.id)
  end
end
