class ApplicationController < ActionController::Base
        helper_method :logged_in?
        helper_method :require_login
        helper_method :current_user
        helper_method :current_employee
        
      


    # def logged_in?
    #     session[:employ_id] 
    # end    

    def require_login
      if !current_user
        flash[:notice] = "plese login first."
          redirect_to root_path
      end
    end

    def current_user
        @current_user ||= Employee.find(session[:employee_id]) if 

        session[:employee_id]
    end 

    def current_type
      current_user.type == "Admin"
    end
     

    

    end

