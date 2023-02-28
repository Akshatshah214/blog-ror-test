class HomeController < ApplicationController
  def index
    @post = Post.where("published= true").order("created_at DESC").page params[:page]
  
  end

  def profile
    render template: "home/profile"
  end
  def usersave
    
    @savepost=Postsave.where("user_id=?",current_user).select(:post_id).distinct
    render template: "home/usersave"
  end
  def userpage
    @like=Like.joins(:post).where(:posts => { :user_id => current_user}).count

    @cm = Comment.joins(:post).where(:posts => { :user_id => current_user.id}).count
    @post = Post.where("user_id=?",current_user).order("created_at DESC").page params[:page]
    render template: "home/userpost"
  end
  def yoga
    @post=Post.where("category=?","yoga").order("created_at DESC").page params[:page]
    render template: "home/yoga"

  end
  def historical
    @post= Post.where("category=?","historical").order("created_at DESC").page params[:page]
    render template: "home/historical"

  end
  def food
    @post= Post.where("category=?","food").order("created_at DESC").page params[:page]
    render template: "home/food"

  end
  def ufile
    @user = User.find(params[:format])
    render template: "home/ufile"
  end
end
