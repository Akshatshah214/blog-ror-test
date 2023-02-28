class LikesController < ApplicationController
    
    def create
      if user_signed_in?
        @like = Like.new(users_id:current_user.id,post_id:params[:post_id])
    
        if @like.save
          
          redirect_to root_path  
        else
          flash[:alert]= "not save like"
          redirect_to root_path 
        end
      else
        flash[:alert]= "please login first"
        redirect_to root_path
      end
       
    end
    def destroy
      @like = Like.find(params[:id])
      if @like.destroy
       
        redirect_to root_path, status: :see_other
      else
        flash[:alert]= "error"
        redirect_to root_path, status: :see_other
      end 
    end
end
