class EmployeesController < ApplicationController
 before_action :require_login

  def new 
    @employee = Employee.new
    @employee.addresses.new
    @path =  "/employees/"
  end
  def index
    if current_type
     @employee = Employee.order("created_at DESC").search(params[:search]).paginate(:page => params[:page], :per_page=>3)
     # @employee = Employee.all.paginate(:page => params[:page], :per_page=>1)
   else
    @leaves = Leave.where(employee_id:current_user.id)
   end
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
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  # end
  end
  def really_destroy
    @employee = Employee.with_deleted.find(params[:id])
    @employee.destroy_fully!
    redirect_to deleted_employee_path
  # end
  end
   
  def search
    @employee = Employee.search(params[:search])
    redirect_to employees_path
  end

  def deleted_employee
    @employee = Employee.with_deleted.where.not(deleted_at:nil)
  end
  def restore_employee
    @employee = Employee.with_deleted.find(params[:id])
      @employee.update(deleted_at:nil) 
     redirect_to employees_path
  end

  def bulk_destroy
    Employee.with_deleted.where(id: params[:collection_ids]).destroy_all
     redirect_to deleted_employee_path
  end

private

  def employee_params
    params.require(get_access.to_sym).permit(:name, :contact ,:email ,:type, :search, :password,:department_id,:collection_ids, :avatar,addresses_attributes: [:id, :c_address, :p_address])
  end

  def get_access
    if params[:action] == "create"
      "employee"
    else
      params[:admin].present? ? "admin" : "employe"
    end 
  end
end




