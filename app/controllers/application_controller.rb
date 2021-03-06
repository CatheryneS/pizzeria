class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !current_user.nil?
    end

    def require_login
        if !logged_in?
            flash[:error] = "You must be logged in to access" 
            redirect_to login_path
        end 
    end
end
