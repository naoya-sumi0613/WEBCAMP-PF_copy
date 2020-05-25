class Admins::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: params[:id]).page(params[:page]).per(12)
    @name = "#{@user.last_name}#{@user.first_name}さん"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end
end
