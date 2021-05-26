class PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find_by(id: params[:id])
    if post
      render json: post, status: :found 
    else 
      render json: {errors: "Post not found"}
    end
  end
end
