class EmployeePolicy < ApplicationPolicy

  # def show
  #    @user.type == "Admin"
  # end
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end

    
  # end
attr_reader :current_user, :department
  def initialize(current_user, department)
    @employee = current_user
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
