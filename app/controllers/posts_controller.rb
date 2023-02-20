class PostsController < ApplicationController
  def index
    @post = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to root_path
  end
  private
    def post_params
      params.require(:post).permit(:title ,:content,:author,:published,:file)
    end
end
