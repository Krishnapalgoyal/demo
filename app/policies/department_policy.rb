class DepartmentPolicy < ApplicationPolicy
  attr_reader :current_employee, :departments

  def initialize(current_employee, departments)
    @user = current_employee
    @record = departments
  end

  def index?
    @user.type == "Admin"
  end

  def show?
    @user.type == "Admin"
  end

  def create?
    @user.type == "Admin"
  end

  def new?
    create?
  end

  def update?
    @user.type == "Admin"
  end

  def edit?
    update?
  end

  def destroy?
   @user.type == "Admin"
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
