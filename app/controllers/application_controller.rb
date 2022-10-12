class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  def current_type
    current_user.type == "Admin"
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

end

