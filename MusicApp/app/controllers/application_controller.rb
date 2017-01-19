class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :log_out

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
    flash[:notice] = "Successfully Signed In!"

    redirect_to bands_url
  end

  def log_out
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    flash[:notice] = "Successfully Signed Out!"
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_signed_in
    unless logged_in?
      flash[:notice] = "You have to sign in first!"
      redirect_to new_sessions_url
    end
  end

  def redirect_if_signed_in
    unless current_user.nil?
      flash[:notice] = "You are already signed in!"
      redirect_to bands_url
    end
  end

end
