class AuthorsController < ApplicationController
  def index
    authors = Author.all 
    render json: authors
  end

  def show
    author = Author.find_by(id: params[:id])
    if author
      render json: author, status: :found 
    else 
      render json: {errors: "Author not found"}
    end
  end

end
