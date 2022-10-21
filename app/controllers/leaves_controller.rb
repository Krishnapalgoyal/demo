class LeavesController < ApplicationController
before_action :authenticate_employee!

  def new
   @leave = Leave.new  
  end 

  def index
    @leaves = Leave.where(status:"requested")
  end
  def create
     @leave = Leave.new(leave_params)
    if @leave.save
      redirect_to employees_path
    else
       render new
    end
  end

  def leave_status

   @leave = Leave.find(params[:id])
   @leave.update(status:"approved")
   redirect_to leaves_path
  end
  def rejected
   @leave = Leave.find(params[:id])
   @leave.update(status:"rejected")
   redirect_to leaves_path
  end
  
  private
   def leave_params
      params.require(:leave).permit(:employee_id,:from_date, :to_date )
    end
end
