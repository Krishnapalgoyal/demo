class AssignLeavesController < ApplicationController

  def new
    @assign = AssignLeave.new  
  end 

  def index
  end

  def leave_assign
    @emp = Employee.find(params[:id])
    @assing = @emp.build_assign_leave

    render 'index'
  end

  def create
    if @assign = AssignLeave.find_by(employee_id: params[:employee])
      @assign.update(assign_params)
      redirect_to employees_path
    else
      @assign = AssignLeave.new(assign_params)
      @assign.save
       redirect_to employees_path
    end
  end



  




  private
    def assign_params
     params.require(:assign_leave).permit(:day,:year,:employee_id)
    end
end
