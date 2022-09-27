module ApplicationHelper
  def current_type
    current_user.type == "Employer"
  end
end
