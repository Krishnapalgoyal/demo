class ApplicationController < ActionController::Base
        helper_method :logged_in?
        helper_method :require_login
        helper_method :current_user
   

    def logged_in?
        session[:admin_id] 
    end    

    def require_login
      if !logged_in?
        flash[:notice] = "plese login first."
          redirect_to new_sessions_path
      end
    end

    def current_user
        @current_user ||= User.find(session[:admin_id]) if 

        session[:admin_id]
      end
    end

