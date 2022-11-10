require 'support/factory_bot'
require 'rails_helper.rb'
require 'employees_controller.rb'


RSpec.describe EmployeesController, type: :request do
  describe "GET #index" do
    it "assigns all employees as @employees" do
    employee = Employee.all 
  end
end

describe "POST #create" do
  it "create a new employee as @employee"do 
    employee = FactoryBot.create(:employee)
    redirect_to employees_path
    end
  end
   it "destroy" do
    employee = FactoryBot.create(:employee)
    employee.destroy
    redirect_to employees_path
  end

  it "update" do
    employee = FactoryBot.create(:employee)
    employee.update(email:"goyal@123.gmail.com")
    redirect_to employees_path
  end
end





RSpec.describe EmployeesController, type: :model do
  context "when creating a employee" do
     let(:employee){build :employee}
     it "shoud be valid employee with all attribute" do
        employee.valid? == true
     end
  end
end