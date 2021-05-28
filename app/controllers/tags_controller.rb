class TagsController < ApplicationController
  def index
    tags = Tag.all
    render json: tags
  end

  def show
    tag = Tag.find_by(id: params[:id])
    if tag
      render json: tag
    else 
      render json: { errors: "Tag not found" }
    end
  end

end
