class LeavesController < ApplicationController

  def new
   @leave = Leave.new  
  end 

  def index
    @leaves = Leave.all
  end
  def create
     @leave = Leave.new(leave_params)
    if @leave.save
      redirect_to leaves_path
    else
       render new
    end

  end
  
  private
   def leave_params
      params.require(:leave).permit(:employee_id,:from_date, :to_date,:total_day)
    end
end
