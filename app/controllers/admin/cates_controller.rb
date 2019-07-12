class Admin::CatesController < ApplicationController
  layout "admin"
  def new
    @cate = Cate.new
  end

  def index
    @cates = Cate.all
  end

  def show
    @cate = Cate.find params[:id]
  end

  def create
    @cate = Cate.new cate_params
    if @cate.save
      flash[:success] = I18n.t "controllers.admin.cates.create"
      redirect_to admin_cates_path params[:locale], @cate
    else
      render 'new'
    end
  end

  def edit
    @cate = Cate.find params[:id]
  end

  def update
    @cate = Cate.find params[:id]
    if @cate.update_attributes cate_params
      flash[:success] = I18n.t "controllers.admin.cates.update"
      redirect_to admin_cates_path params[:locale], @cate
    else
      render "edit"
    end
  end

  def destroy
    Cate.find(params[:id]).destroy
    flash[:success] = I18n.t "controllers.admin.cates.destroy"
    redirect_to admin_cates_url
  end

  private

  def cate_params
    params.require(:cate).permit :title
  end
end
