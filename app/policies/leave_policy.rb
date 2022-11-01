class LeavePolicy < ApplicationPolicy
  attr_reader :current_employee, :department
  def initialize(current_employee, department)
    @employee = current_employee
   @department = department
  end

  def index?
    @employee.type == "Admin"
  end
   def new?
    create?
   end    
  def create?
    @employee.type == "Employe"
  end

  def leave_status?
     @employee.type == "Admin"
  end

  def rejected?
    @employee.type == "Admin"
  end

  class Scope < LeavePolicy
    def initialize(current_employee, scope)
      @user = current_employee
      @scope = scope
    end

    def resolve
      if @user.type == "Admin"
        scope.all
      else
        scope.where(status:"requested")
      end
    end

    private

    attr_reader :current_employee, :scope
  end
end
