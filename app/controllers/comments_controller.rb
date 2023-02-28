class CommentsController < ApplicationController
 
  def index
    if user_signed_in?
      @post = Post.find(params[:post_id])
      if @current_user.id == @post.user.id 

          @comment = @post.comments.all
      elsif  @current_user.admin? == true
          @comment = @post.comments.all
      else
          @comment= @post.comments.where(published:true)
      end
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
    
    if @comment.save
      SendNotificationMailer.create_notification(@comment).deliver_now
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

  def publish
   @comment = Comment.find(params[:format])
   @comment.update(published:true)
   flash[:alert]= "your comment is publish"
   redirect_to root_path
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
