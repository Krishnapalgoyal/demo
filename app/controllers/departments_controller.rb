class DepartmentsController < ApplicationController
 before_action :require_login
 before_action :current_type

  def new
     @departments = Department.all
    @department = Department.new
  end
  
  def index
    @departments = Department.all
    
  end
    
  def create
     
    @department = Department.create(d_params)
    @departments = Department.all
    respond_to do |format|
      format.html {redirect_to new_department_path}
      format.js 
    end
   end
  # if @department.save

  #     redirect_to departments_path
  #   else
  #     render :new
  #   end
  

  def edit
      @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])

    if @department.update(d_params)
      redirect_to @department
    else
      render :edit
    end
  end

  def show
     @department = Department.find(params[:id])
  end
   
  def destroy
    # if current_user
    #   redirect_to root_path 
    #   flash[:notice] = "you dont delete your self plese log out "
    # else 
    @department = Department.find(params[:id])
    @department.destroy
   respond_to do |format|   
      format.html { redirect_to department_url }   
      format.json { head :no_content }   
      format.js   { render :layout => false }   
   end   

    redirect_to departments_path
  # end
  end

  def all_employee
    @department = Department.find(params[:id])
    @department.employees
  end 



  private

  def d_params
        params.require(:department).permit(:name, :jobroll)
  end
end

