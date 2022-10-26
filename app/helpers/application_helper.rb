module ApplicationHelper
  def current_type
    current_employee.type == "Admin"
  end
 

  def assignd_leave
      current_employee.assign_leave
  end


  def approved_leave 
    current_employee.leaves.approved
  end

  def total_leave
    approved_leave.pluck(:total_day).sum
  end


end

