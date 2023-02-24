class AdminsController < ApplicationController
  def index
    @user=User.where(admin:false)
    
  end
  def userpage
    
  end
  def userprofile
    @user = User.find(params[:id])
    @cm = Comment.joins(:post).where(:posts => { :user_id => @user.id}).count
    @post = Post.where("user_id=?",@user.id).page params[:page]

    render template: "admins/userprofile"
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admins_path, status: :see_other
  end

end
