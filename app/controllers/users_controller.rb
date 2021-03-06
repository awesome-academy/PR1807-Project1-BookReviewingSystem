class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Sign Up Success ! Welcome to the booksreview"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
     @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to user_path @user
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
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
