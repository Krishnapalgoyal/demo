class AssignLeavesController < ApplicationController
  before_action :is_true_admin?,only: [:create,:edit,:update,:leave_assign]
  before_action :authenticate_employee!
  def new
    @assign = AssignLeave.new  
  end 

  def index
    @assign= AssignLeave.all
  end

  def leave_assign
    @emp = Employee.find(params[:id])
    @assing =AssignLeave
    end

  def create
    if AssignLeave.find_by(employee_id: assign_params[:employee_id],year: assign_params[:year])
      @assign = AssignLeave.find_by(employee_id: assign_params[:employee_id])
      @assign.update(assign_params)
    else
      @assign = AssignLeave.new(assign_params)
      @assign.save
    end
    if @assign.update(assign_params) || @assign.save
      redirect_to assign_leaves_path
    else
      redirect_to assign_leaves_path, alert: "Use proper year formate"
    end
  end



  private
    def assign_params
      params.require(:assign_leave).permit(:day,:year,:employee_id)
    end
end
