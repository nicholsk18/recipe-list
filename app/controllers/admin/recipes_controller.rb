class Admin::RecipesController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find_by(user_id: Current.user.id, id: params[:id])

    if @recipe.nil?
      flash[:alert] = 'You do not have access to that recipe'
      redirect_to admin_dashboard_path
    end

  end

  def update
    @recipe = Recipe.find_by(id: params[:id], user_id: Current.user.id)

    recipe_image = params[:picture]
    # rename file for easier access
    img_type = recipe_image.content_type.split("/")[-1]

    image_file = Rails.root.join('public', 'uploads', "recipe-#{@recipe.id}.#{img_type}")

    if !File.exist?(image_file)
      File.open(Rails.root.join('public', 'uploads', "recipe-#{@recipe.id}.#{img_type}"), 'wb') do |file|
        file.write(recipe_image.read)
      end
    end

    if (@recipe.update(recipe_params))
      redirect_to admin_dashboard_path
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = User.find(Current.user.id)
    @recipe = @user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to admin_dashboard_path
    else
      flash[:alert] = "Your recipe could not be saved. Try again or contact admin. #{@recipe.errors.full_messages}"
      render :new
    end
  end

  private
  def recipe_params
    params.permit(:title, :description, :recipe_body)
    # .merge(user_id: Current.user.id)
  end
end
