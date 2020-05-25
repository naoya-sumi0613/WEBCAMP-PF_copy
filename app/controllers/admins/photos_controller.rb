class Admins::PhotosController < ApplicationController
  before_action :authenticate_admin!
  def index
    @photos = Photo.page(params[:page]).per(12)
    @name = "投稿一覧"
    if params[:tag_name]
      @photos = Photo.tagged_with("#{params[:tag_name]}").page(params[:page]).per(12)
      @name = "”#{params[:tag_name]}”一覧"
    elsif params[:created_at]
      @photos = Photo.where(created_at: Time.zone.now.all_day).page(params[:page]).per(12)
      @name = "本日の新規投稿一覧"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to admins_photos_path
  end
end
