class Admin::BooksController < ApplicationController
  layout "admin"
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = I18n.t "controllers.admin.books.create"
      redirect_to admin_books_path @book
    else
      render "new"
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    if @book.update_attributes book_params
      flash[:success] = I18n.t "controllers.admin.books.update"
      redirect_to admin_books_path @book
    else
      render "edit"
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = I18n.t "controllers.admin.books.destroy"
    redirect_to admin_books_url
  end

  private

  def book_params
    params.require(:book).permit :title, :author, :cate_id, :description,
                                  :image, :remove_image, :image_cache
  end
end
