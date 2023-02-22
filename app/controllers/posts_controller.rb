class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end
  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to "/home/userpage"
    else
      render :new, status: :unprocessable_entity
    end
   
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to "/home/userpage"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/home/userpage", status: :see_other
  end
  
  private
    def post_params
      params.require(:post).permit(:title ,:content,:author,:published,:file)
    end
end
