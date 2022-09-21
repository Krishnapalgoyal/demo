class Employee < ApplicationRecord

def new
  @employee = Employee.new 
end  
 def index
    @employee = Employee.all
  end


end
