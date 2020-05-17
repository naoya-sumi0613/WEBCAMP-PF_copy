class Users::UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @photos = Photo.where(user_id: params[:id]).order(created_at: "DESC")
  	if @user == current_user
  		@name = "あなた"
  	else
  		@name = "#{@user.last_name}#{@user.first_name}さん"
  	end
  end

  def edit
  	@user = User.find(current_user.id)
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(params[:id])
  end

  def retire
  end

  def destroy
  	@user = User.find(current_user.id)
  	@user.destroy
  	redirect_to root_path
  end

  def follow
    @user = User.find(params[:id])
    @users = @user.following_user
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.follower_user
  end

  def user_params
  	params.require(:user).permit(:image, :last_name, :first_name, :read_last_name, :read_first_name, :email, :introduction)
  end
end
