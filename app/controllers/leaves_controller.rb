class LeavesController < ApplicationController
before_action :is_true_admin?,only: [:leave_status,:rejected]
before_action :authenticate_employee!

  def new
   @leave = Leave.new  
  end 

  def index
    @requested_leave = Leave.requested
    @leaves = Leave.where(employee_id:current_employee.id)
  end
  def create
    debugger
     @leave = Leave.new(leave_params)
     # authorize @leave
    if @leave.save
      redirect_to leaves_path
    else
       render new
    end
  end

  def leave_status
   @leave = Leave.find(params[:id])
    # authorize @leave
   @leave.update(status:"approved")
   redirect_to leaves_path
  end
  def rejected
   @leave = Leave.find(params[:id])
    # authorize @leave
   @leave.update(status:"rejected")
   redirect_to leaves_path
  end
  
  private
   def leave_params
      params.require(:leave).permit(:employee_id,:from_date, :to_date )
    end
end
