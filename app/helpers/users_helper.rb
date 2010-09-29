module UsersHelper
  def logged_in?
    session[:user_id].present?
  end

  def current_user
    if (id = session[:user_id]).present?
      User.find(id)
    else
      raise User::NotAuthenticated.new
    end
  end
end
