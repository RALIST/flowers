class Florist::FloristController < ApplicationController

  before_action :have_to_auth
  @disable_subscribe = true

  def have_to_auth
    @disable_subscribe = true
    unless logged_in? && current_user.role == 'florist'
      redirect_to florist_login_path
      flash[:danger] = 'Необходимо войти под аккаунтом компании!'
    end
  end
end
