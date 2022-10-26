module EmployeesHelper

  def search
    current_employee.type == "Admin"
  end
  
end
