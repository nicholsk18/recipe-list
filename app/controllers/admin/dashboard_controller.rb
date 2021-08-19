class Admin::DashboardController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @recipes = Recipe.all
  end

end
