class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order_by_creation
  end

  def show
    @author = Author.find(params[:id])
  end
end
