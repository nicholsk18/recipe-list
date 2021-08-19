class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.userID
            redirect_to admin_dashboard_path, notice: 'logged in'

        else
            flash.now[:alert] = 'invalid email or password'
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged Out'
    end
end