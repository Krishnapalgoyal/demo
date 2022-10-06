module ApplicationHelper
  def current_type
    current_user.type == "Admin"
  end
   def current_user
        @current_user ||= Employee.find(session[:employee_id]) if 
        session[:employee_id]
    end
end
