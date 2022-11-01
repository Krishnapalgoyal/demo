class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :logged_in?
  helper_method :true_employe?
  helper_method :is_admin?
  helper_method :is_employee?
  helper_method :current_employee
  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_true_admin?
    redirect_to root_path, notice: "You are not admin." unless is_admin? 
  end
  def is_admin?
    current_employee.type == "Admin"
  end

  def true_employe?
   redirect_to root_path, notice: "You are not an authorized employee." unless current_employee.status 
  end

  def is_employee?
   current_employee.type == "Employe"
  end

  def after_sign_in_path_for(resorce)
    if is_admin?
      employees_path
    elsif is_employee?
      leaves_path
    else
      root_path
    end
  end
  def pundit_user
    current_employee
  end
  protected
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :contact, :type, :email,:department_id, :search,:collection_ids, :avatar,:password,:status, addresses_attributes: [:id, :c_address, :p_address])}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :contact, :type, :email,:department_id, :search,:collection_ids, :avatar,:password,:status, addresses_attributes: [:id, :c_address, :p_address])}
  end
  end



