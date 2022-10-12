# class DepartmentPolicy < ApplicationPolicy
#   class Scope < Scope
#     # NOTE: Be explicit about which records you allow access to!
#     # def resolve
#     #   scope.all
#     # end

#   end
# end

class DepartmentPolicy < ApplicationPolicy 
  attr_reader :user, :record



  def initialize(employee, department)
    @employee = employee
   @department = department
  end

  def index?
    @employee.type == "Admin"
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
