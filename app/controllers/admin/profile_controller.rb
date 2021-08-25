class Admin::ProfileController < ApplicationController
    def index
        @user = User.find(Current.user.userID)
    end

    def edit
        @user = User.find(Current.user.userID)

        if @user.update(user_params)
            flash[:notice] = "Your changes where saved"
            redirect_to admin_dashboard_path
        else
            render :index
        end
    end

    private
    def user_params
        params.permit(:fName, :lName, :email)
    end
end