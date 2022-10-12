class AuthorsBooksController < ApplicationController
  def index
    @authors = Author.find(params[:id])
    @books = @authors.books
  end
end
