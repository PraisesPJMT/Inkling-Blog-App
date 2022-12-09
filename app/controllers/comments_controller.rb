class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    author = current_user
    post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = author
    @comment.post = post
    if @comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:error] = 'There was a problem creating the comment'
    end
    redirect_to "/users/#{author.id}/posts/#{post.id}"
  end

  # private
  #
  # def comment_params
  #   params.require(:comment).permit(:text)
  # end
end
