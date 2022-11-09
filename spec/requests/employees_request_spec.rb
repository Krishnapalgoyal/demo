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





# RSpec.describe EmployeesController, type: :model do

#   describe "validations" do 
#     it 'is database authenticable' do
#       employee = Employee.create(
#         email: 'test@example.com', 
#         password: 'password123',
#         password_confirmation: 'password123'
#       )
#       expect(employee.valid_password?('password123')).to be_truthy
#     end
#   end
# end