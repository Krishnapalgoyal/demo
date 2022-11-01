class DepartmentsController < ApplicationController
  before_action :is_true_admin?
  before_action :authenticate_employee! 
  def new
    @department = Department.new
    respond_to do |format|
      format.html {redirect_to new_department_path}
      format.js
    end
  end

  def index
    @departments = Department.all
    authorize @department, policy_class: DepartmentPolicy
  end

  def create
    @department = Department.create(d_params)
    authorize @department, policy_class: DepartmentPolicy
    respond_to do |format|
      format.html {redirect_to new_department_path}
      format.js 
    end
  end

  def edit
    @department = Department.find(params[:id])
    authorize @department, policy_class: DepartmentPolicy
    respond_to do |format|
      format.html {redirect_to new_department_path}
      format.js 
    end
  end

  def update
    @department = Department.find(params[:id])
    authorize @department, policy_class: DepartmentPolicy
    if @department.update(d_params)
      respond_to do |format|
        format.html {redirect_to @department}
        format.js 
      end
    else
      render :edit
    end
  end

  def show
    @department = Department.find(params[:id])
    authorize @department, policy_class: DepartmentPolicy
  end

  def destroy
    @department = Department.find(params[:id])
    authorize @department, policy_class: DepartmentPolicy
    @department.destroy
    respond_to do |format|   
      format.html { redirect_to department_path }   
      format.json { head :no_content }   
      format.js   { render :layout => false }   
    end   
  end

  def all_employee
    @department = Department.find(params[:id])
    @employee = @department.employees.where(status:true)
  end 

  private
  def d_params
    params.require(:department).permit(:name, :jobroll)
  end
end

