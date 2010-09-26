module UsersHelper
  def logged_in?
    session[:user_id].present?
  end

  def current_user
    if (id = session[:user_id]).present?
      User.find(id)
    else
      raise "not loged in"
    end
  end
end
