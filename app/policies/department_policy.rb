# class DepartmentPolicy < ApplicationPolicy
#   class Scope < Scope
#     # NOTE: Be explicit about which records you allow access to!
#     # def resolve
#     #   scope.all
#     # end

#   end
# end

class DepartmentPolicy < Struct.new(:user, :department)
  def index?
    user.is_admin?
  end

  def new?
    user.is_admin?
  end

  def create?
    user.is_admin?
  end

  def edit?
    user.is_admin?
  end

  def update?
    user.is_admin?
  end

  def destroy?
    user.is_admin?
  end
end