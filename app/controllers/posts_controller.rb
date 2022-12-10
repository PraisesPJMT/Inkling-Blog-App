class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new

    render :new, locals: { post: @post }
  end

  def create
    post = current_user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post created successfully!'
          redirect_to user_posts_path(current_user)
        else
          flash[:error] = 'Something went wrong! Post not created!'
          render :new, locals: { post: }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
