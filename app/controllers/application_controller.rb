class ApplicationController < ActionController::Base
  protect_from_forgery
  include UsersHelper
  helper :users
  
  rescue_from User::NotAuthenticated, :with => :not_authenticated
  
  def not_authenticated
    redirect_to login_users_path
  end

  def dump_error(exception)
    render :text => exception.to_s
  end
end
