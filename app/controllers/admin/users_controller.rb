class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  layout "admin"

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def edit
     @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = I18n.t "controllers.admin.users.update"
      redirect_to admin_user_path @user
    else
      render "edit"
    end
  end

  private
    def user_params
      params.require(:user).permit :name, :email, :password,
        :password_confirmation, :mobile, :address, :birthdate, :image,
        :remove_image, :image_cache
    end
       # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = I18n.t "controllers.admin.users.logged"
        redirect_to admin_login_url
      end
    end
end
