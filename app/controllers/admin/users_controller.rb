class Admin::UsersController < ApplicationController
  layout "admin"

  def show
    @user = User.find params[:id]
  end
end
