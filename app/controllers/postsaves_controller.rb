class PostsavesController < ApplicationController
  def index
  end
  def new
    @user = current_user.id
    @post = Post.find(params[:post_id])
    @postsave = Postsave.new
    redirect_to post_create_order_path
  end
  def create
    if user_signed_in?
      @postsave = Postsave.new(user_id:current_user.id,post_id:params[:post_id])
      if @postsave.save
        
        redirect_to root_path  
      else
        flash[:alert]= "not save post"
        redirect_to root_path 
      end
    else
      flash[:alert]= "please login first"
      redirect_to root_path
    end
   
  end
  def destroy
    @postsave = Postsave.find(params[:id])
    if @postsave.destroy
      flash[:alert]= "unsave post"
      redirect_to root_path, status: :see_other
    else

      redirect_to root_path, status: :see_other
    end
  end
end
