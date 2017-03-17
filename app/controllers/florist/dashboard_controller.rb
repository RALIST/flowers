class Florist::DashboardController < Florist::FloristController
  def index
    @user = Florist.find(session[:user_id])
  end
end
