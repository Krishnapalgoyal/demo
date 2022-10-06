class EmployeesController < ApplicationController
 before_action :require_login

  def new 
    @employee = Employee.new
    @employee.addresses.new
    @path =  "/employees/"
  end
  def index
     @employee = Employee.search(params[:search]).paginate(:page => params[:page], :per_page=>2)
     # @employee = Employee.all.paginate(:page => params[:page], :per_page=>1)
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
     @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
       render new
    end

  end

  def edit
    @employee = Employee.find(params[:id])
      @path =  "/employees/#{@employee.id}"
  end

  def update
    @employee = Employee.find(params[:id])
   # Address.find_by(employee_id: @employee.id).id
    @path =  "/employees#update"
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    # if current_user
    #   redirect_to root_path 
    #   flash[:notice] = "you dont delete your self plese log out "
    # else 
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  # end
  end
   
  def search
    @employee = Employee.search(params[:search])
    redirect_to employees_path
  end

  # def leave
  #   if current_type
  #   @leave = Leave.find_by(status: false) 
  #   else

  # def leave_request
  #   @leave = Leave.create(employee_id: current_user.id, status: false)
  #   flash[:notice] = "request is send."
  #   redirect_to employees_path(current_user.id)
  # end
  
  # def leave_index
  #   @leave = Leave.find_by(status:false)
  #   @employee =Employee.find_by(id:@leave.employee_id).name
  # end

private

    def employee_params
      params.require(:employee).permit(:name, :contact ,:email ,:type, :search, :password,:department_id ,addresses_attributes: [:id, :c_address, :p_address])
    end
end




