class DepartmentsController < ApplicationController
       before_action :require_login 

  def new
    @department = Department.new
  end
   def index
    @departments = Department.all
  end
    
  def create
    @department = Department.new(d_params)

    if @deparment.save
      redirect_to @department
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
   

  private
  def d_params
        params.require(:department).permit(:name, :jobroll)
  end
end
