class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to("/books/#{@book.id}")
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to("/books")
  end

  private

  def book_params
    params.permit(:title, :best_seller, :pages, :author_id)
  end
end
