class Admin::DashboardController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @recipes = Recipe.where(user_id: Current.user.id)
  end

end
