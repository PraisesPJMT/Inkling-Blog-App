class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    author = current_user
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = author
    @comment.post = post
    if @comment.save
      flash[:success] = 'Comment Added successfully!'
    else
      flash[:error] = 'Something went wrong! Comment not added!'
    end
    redirect_to "/users/#{author.id}/posts/#{post.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
