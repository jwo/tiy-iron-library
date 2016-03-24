class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  def store_location
    session[:return_to] = request.fullpath if request.get? && controller_name != "user" && controller_name != "session"
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
  end
end
