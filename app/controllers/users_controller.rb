class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(params[:user])
    session[:user_id] = @user.id
    redirect_to user_path(current_user)
  rescue ActiveRecord::RecordInvalid => bang
    @user = bang.record
    render :action => :new
  end
  
  def show
    redirect_to user_videos_path(User.find(params[:id]))
  end
  
  def login
    if logged_in?
      redirect_to user_path(current_user)
      return
    end
    if request.post?
      if user = User.find_by_email(params[:user][:email])
        session[:user_id] = user.id
        redirect_to user_path(current_user)
      else
        flash[:error] = "#{params[:user][:email]} could not be logged in"
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to login_users_path
  end
end