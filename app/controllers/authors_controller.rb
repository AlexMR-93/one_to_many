class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order_by_creation
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to("/authors")
    else
      redirect_to("/authors/new")
      flash[:alert] = "Error"
    end
  end

  private

  def author_params
    params.permit(:name, :has_won_awards, :books_written)
  end
end
