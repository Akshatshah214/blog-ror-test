class CommentsController < ApplicationController
 
  def index
    if user_signed_in?
      @post = Post.find(params[:post_id])
      @comment = @post.comments.all
    else
      flash[:alert]= "please login first"
      redirect_to root_path
    end
    
  end
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @post.save
      redirect_to "/home/userpage"  
    else
      render :new, status: :unprocessable_entity
    end
   
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    authorize! :destroy, @comment
    redirect_to post_comments_url, status: :see_other
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
