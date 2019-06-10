class Admin::SessionsController < ApplicationController
  layout "admin"

  def new
  end

  def create
     user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      flash[:success] = "Welcome to the Book review system!"
      redirect_to admin_user_path user
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_root_url
  end
end
