class ApplicationController < ActionController::Base
  protect_from_forgery
  include UsersHelper
  helper :users
end
