module ApplicationHelper
  def current_type
    current_user.type == "Admin"
  end
  def current_user
    @current_user ||= Employee.find(session[:employee_id]) if 
    session[:employee_id]
  end

  def assignd_leave
    if current_user.assign_leave
      current_user.assign_leave.day
    else
      "you have no assign_leave"
    end
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