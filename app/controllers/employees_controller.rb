class EmployeesController < ApplicationController
  before_action :is_true_admin?,except: [:show]
  before_action :authenticate_employee!
  skip_before_action :verify_authenticity_token
  before_action :present,only: [:edit, :show ,:update, :destroy,:enroll_employee]

  def present
    @employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:notice] = "this employee is not present"
    redirect_to root_path
  end
  def new 
    @employee = Employee.new
    @employee.addresses.new
    @path =  "/employees/"
  end

  def index
    @employee = Employee.where(status:true).order("created_at DESC").search(params[:search]).paginate(:page => params[:page], :per_page=>3)
  end

  def show
    if is_admin?
      @employee = Employee.find(params[:id])
    elsif params[:id].to_i == current_employee.id
      @employee = current_employee
    else
      redirect_to root_path, notice: "You are not an athorize user."
    end
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
  end

  def really_destroy
    @employee = Employee.with_deleted.find(params[:id])
    @employee.destroy_fully!
    redirect_to deleted_employee_path
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

  def bulk_delete
    Employee.where(id: params[:collection_ids]).destroy
    redirect_to deleted_employee_path
  end

  def employee_request
    @employees = Employee.where(status: false)
  end

  def enroll_employee
    @employee = Employee.find(params[:id])
    @employee.update(status: true)
    redirect_to employee_request_path
  end

  private
  def employee_params
    params.require(get_access.to_sym).permit(:name, :contact ,:email ,:type, :search, :password,:department_id,:collection_ids, :avatar,:status,addresses_attributes: [:id, :c_address, :p_address])
  end

  def get_access
    if params[:action] == "create"
      "employee"
    else
      params[:admin].present? ? "admin" : "employe"
    end 
  end

end




