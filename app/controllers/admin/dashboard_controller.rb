class Admin::DashboardController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
