class Florist::DashboardController < Florist::FloristController
  def index
    @user = Florist.find(current_user.id)
  end
end
