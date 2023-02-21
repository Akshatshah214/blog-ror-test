class HomeController < ApplicationController
  def index
    @post = Post.where("published= true")
  end

  def profile
    render template: "home/profile"
  end
  def userpage
    @post = Post.where("user_id=?",current_user)
    render template: "home/userpost"
  end
end
