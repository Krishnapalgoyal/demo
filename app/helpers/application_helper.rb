module ApplicationHelper
  def current_type
    current_user.type == "Admin"
  end
  def current_user
    @current_user ||= Employee.find(session[:employee_id]) if 
    session[:employee_id]
  end

  def is_admin?
    current_user.type == "Admin"
  end
  def is_employee?
    current_user.type == "Employe"
  end

end
