class LeavePolicy < ApplicationPolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end

    
  # end
  # end
  attr_reader :current_user, :department
  def initialize(current_user, department)
    @employee = current_user
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
    def initialize(current_user, scope)
      @user = current_user
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

    attr_reader :current_user, :scope
  end
end
