class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, except: [:destroy]
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    if user.nil?
      flash[:notice] = "You are not a human"
      redirect_to new_sessions_url
    else
      login_user!(user)
    end
  end

  def destroy
    log_out
    redirect_to bands_url
  end
end
