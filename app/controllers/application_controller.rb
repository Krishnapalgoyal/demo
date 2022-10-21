class ApplicationController < ActionController::Base
<<<<<<< HEAD
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
=======
        helper_method :logged_in?
        helper_method :require_login
        helper_method :current_user
        helper_method :current_employee
        
       before_action :configure_permitted_parameters, if: :devise_controller?
>>>>>>> Apply_devise

  helper_method :logged_in?
  helper_method :require_login
  helper_method :current_user
  helper_method :current_type

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

<<<<<<< HEAD
  def current_type
    current_user.type == "Admin"
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

end
=======
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
>>>>>>> Apply_devise

