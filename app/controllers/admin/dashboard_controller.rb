class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :require_user_logged_in!

  def index
    @recipes = Recipe.where(user_id: Current.user.userID)
  end

end
