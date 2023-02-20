class HomeController < ApplicationController
  def index
    @user=User.all
  end

  def profile
    render template: "home/profile"
  end
  def userpage
    render template: "home/userpost"
  end
end
