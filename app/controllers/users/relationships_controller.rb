class Users::RelationshipsController < ApplicationController
  def follow
  	current_user.follow(params[:user_id])
  	redirect_back(fallback_location:root_path)
  end

  def unfollow
  	current_user.unfollow(params[:user_id])
  	redirect_back(fallback_location:root_path)
  end


  def relationship_params
  	params.require(:relationship).permit(:user_id)
  end

end
