class VideosController < ApplicationController
  def welcome
    if logged_in?
      redirect_to user_path(current_user)
    else
      redirect_to login_users_path
    end
  end
  
  def create
    current_user.videos.create!(params[:video])
    redirect_to user_videos_path(current_user)
  end
  
  def new
    @video = current_user.videos.new
  end
  
  def index
    @videos = current_user.videos
    respond_to do |fmt|
      fmt.html
      fmt.atom
      fmt.json
    end
  end
end
