class Admin::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to admin_recipes_path
    else
      render :new
    end
  end

  private
    def recipe_params
      # params.require(:recipe).permit(:title, :description, :recipe_body)
      params.permit(:title, :description, :recipe_body)
    end
end
