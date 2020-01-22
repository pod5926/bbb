class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = current_user.books.order(created_at: :desc)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: "「#{@book.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @book.update!(book_params)
    redirect_to books_url, notice: "「#{@book.name}」を更新しました。"
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: "「#{@book.name}」を削除しました。"
  end

  private

  def book_params
    params.require(:book).permit(:name, :comment)
  end

  def set_book
    @book = current_user.books.find(params[:id])
  end
end
