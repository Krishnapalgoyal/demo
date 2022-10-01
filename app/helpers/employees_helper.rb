module EmployeesHelper

  def search
    current_user.type == "Admin"
  end
end
