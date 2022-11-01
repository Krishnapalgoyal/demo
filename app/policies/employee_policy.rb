class EmployeePolicy < ApplicationPolicy
attr_reader :current_employee, :department
  def initialize(current_employee, department)
    @employee = current_employee
   @department = department
  end

 

  def create?
    @employee.type == "Admin"
  end

  def new?
    create?
  end

  def update?
   @employee.type == "Admin"
  end

  def edit?
    update?
  end

  def destroy?
  @employee.type == "Admin"
  end
  
  def all_employee?
     @employee.type == "Admin"
  end

#   class Scope
#     def initialize(user, scope)
#       @user = user
#       @scope = scope
#     end

#     def resolve
#       raise NotImplementedError, "You must define #resolve in #{self.class}"
#     end

#     private

#     attr_reader :, :scope
#   end

# end
