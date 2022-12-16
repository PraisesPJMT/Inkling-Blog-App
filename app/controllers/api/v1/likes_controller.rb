class Api::V1::LikesController < Api::V1::ApplicationController
  before_action :set_user, only: %i[index show]
  before_action :set_post, only: %i[index show create]

  def create
    post = Post.find(params[:post_id])
    author = current_user
    like = Like.new(post:, author:)

    if like.save
      render json: like, status: :created
    else
      render json: like.error, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = set_user.posts.find(params[:post_id])
  end
end
