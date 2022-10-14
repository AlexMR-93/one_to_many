class AuthorsBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def new
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.find(params[:id])
    @book_created = @author.books.create(author_book_params)
    @book_created.save
    redirect_to("/authors/#{@author.id}/books")
  end

  private

  def author_book_params
    params.permit(:title, :best_seller, :pages, :author_id)
  end
end
