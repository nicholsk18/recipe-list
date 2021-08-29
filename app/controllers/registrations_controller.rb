class RegistrationsController < ApplicationController
  default_form_builder MyFormBuilder

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
        # Keeping for later
        bad_email = @user.valid?(:email)
        # bad_password = @user.valid?(:password)
        # bad_confirmation = @user.valid?(:password_confirmation)

        flash.now[:alert] = "Either email was already used or your passwords do not match"

        render :new
      end
    end
    private
    def user_params
      # strong parameters
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end