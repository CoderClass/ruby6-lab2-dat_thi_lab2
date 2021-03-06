class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def signed_in?
    session[:user_id] ? true : false
  end

end
