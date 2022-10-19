module ApplicationHelper
  def current_type
    current_user.type == "Admin"
  end
  def current_user
    @current_user ||= Employee.find(session[:employee_id]) if 
    session[:employee_id]
  end

  def assignd_leave
      current_user.assign_leave
  end

  # def remaining_leave
  #   if current_user.assign_leave
  #     current_user.assign_leave.day - current_user.leaves.approved
  #   end
  # end

  def approved_leave 
    current_user.leaves.approved
  end

  def total_leave
    approved_leave.pluck(:total_day).sum
  end

end
  def is_admin?
    current_user.type == "Admin"
  end
  def is_employee?
    current_user.type == "Employe"
  end

end

