class ApplicationController < ActionController::Base
        helper_method :logged_in?
        helper_method :require_login
        helper_method :current_user
        helper_method :current_employee
        
       before_action :configure_permitted_parameters, if: :devise_controller?


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
      current_employee.type == "Admin"
    end
     
  def after_sign_in_path_for(resorce)
    employees_path
  end


     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :contact, :type, :email,:department_id, :search,:collection_ids, :avatar,:password, addresses_attributes: [:id, :c_address, :p_address])}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :contact, :type, :email,:department_id, :search,:collection_ids, :avatar,:password, addresses_attributes: [:id, :c_address, :p_address])}
          end



    
 end

