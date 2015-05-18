class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authenticate
    unless current_user
      redirect_to new_sessions_path
    end
  end
  
end
