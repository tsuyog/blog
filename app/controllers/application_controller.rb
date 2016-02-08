class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #we cant access following defs in views so do the following using controllers
  helper_method :current_user, :logged_in?, :require_user

  #for getting current logged in users

  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #debugger
    #User.find_by(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be Logged in to perform the task"
      redirect_to root_path
    end

  end

end
