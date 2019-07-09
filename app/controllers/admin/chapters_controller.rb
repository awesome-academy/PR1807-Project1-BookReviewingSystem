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
      flash[:success] = "Chapter create success !"
      redirect_to admin_chapters_path @chapter
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
      flash[:success] = "Chapter Update !"
      redirect_to admin_chapters_path @chapter
    else
      render "edit"
    end
  end

  def destroy
    Chapter.find(params[:id]).destroy
    flash[:success] = "Chapter delete success !"
    redirect_to admin_chapters_url
  end

  private

  def chapter_params
    params.require(:chapter).permit :title, :content, :book_id
  end
end
