module ApplicationHelper
  def current_type
    current_user.type == "Admin"
  end
end
