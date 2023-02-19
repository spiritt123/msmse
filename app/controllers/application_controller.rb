class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_auto, only: [:index]

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_auto
    current_user
    if @current_user != nil && @current_user.rank == 0
        redirect_to home_root_url
    elsif (@current_user != nil) && ((1..1000).include? @current_user.rank)
        redirect_to home_admin_url
    else
      redirect_to login_path
    end
  end
end
