class DepartmentsController < ApplicationController
 before_action :require_login
 before_action :current_type

  def new
    @department = Department.new
  end
  
  def index
    @departments = Department.all
  end
    
  def create
     
    @department = Department.new(d_params)
  if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

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

