class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(10)
    @name = ""
    if params[:created_at]
      @users = User.where(created_at: Time.zone.now.all_day).page(params[:page]).per(10)
      @name = "本日の新規登録"
    end
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: params[:id]).page(params[:page]).per(24)
    @name = "#{@user.last_name}#{@user.first_name}さん"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end
end
