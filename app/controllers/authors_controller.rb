class AuthorsController < ApplicationController
  def index
    authors = Author.all 
    render json: authors, include: ['profile', 'posts', 'posts.tags']
  end

  def show
    author = Author.find_by(id: params[:id])
    if author
      render json: author, include: ['profile', 'posts', 'posts.tags']
    else 
      render json: { errors: "Author not found" }
    end
  end

end
