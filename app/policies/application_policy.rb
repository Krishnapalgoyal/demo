# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :current_employee, :record

  def initialize(current_employee, record)
    @user = current_employee
    @record = record
  end

  
  class Scope
    def initialize(current_employee, scope)
      @user = current_employee
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :current_employee, :scope
  end
end
