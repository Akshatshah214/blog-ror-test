class AdminsController < ApplicationController
  def index
    @user=User.where(admin:false)
    
  end
  def userprofile
    @user = User.find(params[:id])
    @cm = Comment.joins(:post).where(:posts => { :user_id => @user.id}).count
    @post = Post.where("user_id=?",@user.id)

    render template: "admins/userprofile"
  end

end
