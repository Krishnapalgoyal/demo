class EmployeesController < ApplicationController
  before_action :require_login

  def new 
    @employee = Employee.new
  end
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    
    if @employee.save
      redirect_to employees_path
    
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
   
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to root_path
  end




  private
    def employee_params
      params.require(:employee).permit(:name, :gender ,:age, :address ,:email ,:password ,:department_id)
    end
end



