class ApplicationController < ActionController::Base
        helper_method :logged_in?
        helper_method :require_login
        helper_method :current_user
        helper_method :current_employee
        helper_method :employeeloged_in?


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
        @current_user ||= Admin.find(session[:admin_id]) if 

        session[:admin_id]
      end


      def current_employee
        @current_employee ||= Employee.find(session[:employee_id]) if 

        session[:employee_id]
      end

        def employeeloged_in?
        session[:employee_id] 
    end    

    end

