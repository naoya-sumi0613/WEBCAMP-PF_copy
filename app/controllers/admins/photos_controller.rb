class Admins::PhotosController < ApplicationController
  def index
    @photos = Photo.page(params[:page]).per(12)
    @name = "投稿一覧"
    if params[:tag_name]
      @photos = Photo.tagged_with("#{params[:tag_name]}").page(params[:page]).per(12)
      @name = "”#{params[:tag_name]}”一覧"
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
