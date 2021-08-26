class ApplicationController < ActionController::Base
    before_action :set_current_user
    # include SessionsHelper

    def set_current_user
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id] 
    end

    def require_user_logged_in!
        # Check to make sure user is signed in
        if Current.user.nil?
            redirect_to sign_in_path, alert: 'You must sign in first'
        end
    end
end
