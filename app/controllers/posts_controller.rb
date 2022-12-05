class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def show
    @posts = Post.find(params[:id])
  end
end
