class Users::PhotosController < ApplicationController
  def index
    @photos = Photo.order(created_at: "DESC")
    @user = User.find(current_user.id)
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
  	@photo.user_id = current_user.id
  	@photo.save
  	redirect_to photo_path(@photo.id)
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end


  def photo_params
  	params.require(:photo).permit(:user_id, :image, :word, :range)
  end
end
