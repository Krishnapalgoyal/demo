class ApplicationController < ActionController::Base

  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

        helper_method :logged_in?

       
        helper_method :current_employee
        
       before_action :configure_permitted_parameters, if: :devise_controller?

  

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
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


