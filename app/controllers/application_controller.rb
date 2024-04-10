class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_auth, only: [:index]#, :user, :admin, :root_index]
  #after_action :require_auth, only: [:root, :admin, :user]
  @cur_user = nil

  def current_user
    if session[:user_id]
      @cur_user ||= User.find(session[:user_id])
    else
      @cur_user = nil
    end
  end

  def require_auth
    current_user
    if @cur_user == nil
        redirect_to login_path
    else
      if @cur_user.rank == 0
        redirect_to home_root_url
      elsif (@cur_user != nil) && ((1..1000).include? @cur_user.rank)
        redirect_to home_admin_url
      else
        redirect_to home_user_url
      end
    end
  end
end
