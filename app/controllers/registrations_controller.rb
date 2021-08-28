class RegistrationsController < ApplicationController
    # instantiates new user
    def new
      @user = User.new
    end
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Successfully created account'
      else
        errors = {}
        errors["email"] = @user.valid?(:email)
        errors["password"] = @user.valid?(:password)
        errors["pass_confirmation"] = @user.valid?(:password_confirmation)

        flash.now[:alert] = "Invalid Email or Password #{errors}"
        render :new
      end
    end
    private
    def user_params
      # strong parameters
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end