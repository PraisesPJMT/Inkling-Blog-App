class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    author = current_user
    @like = Like.new(post:, author:)

    if @like.save
      flash[:notice] = 'Like added'
      redirect_to "/users/#{author.id}/posts/#{post.id}"
    else
      flash[:error] = 'Error adding like'
    end
  end
end
