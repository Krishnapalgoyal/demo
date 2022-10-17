module LeavesHelper
  def status
     @status ||=Leave.find_by(status:"requested")
  end


end
