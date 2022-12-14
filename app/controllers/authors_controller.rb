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
    author.update(author_params)
    redirect_to("/authors/#{author.id}")
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy!
    redirect_to("/authors")
  end

  private

  def author_params
    params.permit(:name, :has_won_awards, :books_written, :author_id)
  end
end
