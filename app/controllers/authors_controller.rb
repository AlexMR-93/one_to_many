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
    @author.save
    redirect_to("/authors")
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])

    if author.update(author_params)
      redirect_to("/authors/#{author.id}")
    else
      flash[:notice] = "ERROR!"
      redirect_to("/authors/#{@author.id}/edit")
    end
  end

  private

  def author_params
    params.permit(:name, :has_won_awards, :books_written, :author_id)
  end
end
