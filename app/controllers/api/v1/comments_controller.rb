class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_user, only: %i[index show]
  before_action :set_post, only: %i[index show create]
  before_action :set_comment, only: %i[index show create]

  def index
    comments = @post.comments
    render json: comments, status: :ok
  end

  def show
    render json: @comment, status: :ok
  end

  def create
    author = current_user
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.author = author
    comment.post = post
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.error, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    if comment.destroy
      render json: comment, status: :ok
    else
      render json: comment.error, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = set_user.posts.find(params[:post_id])
  end

  def set_comment
    @comment = set_post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
