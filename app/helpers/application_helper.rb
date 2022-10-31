module ApplicationHelper

  def assignd_leave
      current_employee.assign_leave
  end


  def approved_leave 
    current_employee.leaves.approved
  end

  def total_leave
    approved_leave.pluck(:total_day).sum
  end

  def remaning_leave
    if assignd_leave
     assignd_leave.day - total_leave
    else
      puts "no assign leave"
    end
  end
end

