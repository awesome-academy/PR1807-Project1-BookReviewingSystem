class Admin::ChaptersController < ApplicationController
  layout "admin"
  def new
    @chapter = Chapter.new
  end

  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find params[:id]
  end

  def create
    @chapter = Chapter.new chapter_params
    if @chapter.save
      flash[:success] = I18n.t "controllers.admin.chapters.create"
      redirect_to admin_chapters_path params[:locale], @chapter
    else
      render "new"
    end
  end

  def edit
    @chapter = Chapter.find params[:id]
  end

  def update
    @chapter = Chapter.find params[:id]
    if @chapter.update_attributes chapter_params
      flash[:success] = I18n.t "controllers.admin.chapters.update"
      redirect_to admin_chapters_path params[:locale], @chapter
    else
      render "edit"
    end
  end

  def destroy
    Chapter.find(params[:id]).destroy
    flash[:success] = I18n.t "controllers.admin.chapters.destroy"
    redirect_to admin_chapters_url
  end

  private

  def chapter_params
    params.require(:chapter).permit :title, :content, :book_id
  end
end
