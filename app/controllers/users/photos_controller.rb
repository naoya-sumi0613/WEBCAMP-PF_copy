class Users::PhotosController < ApplicationController
  before_action :authenticate_user!

  impressionist :actions => [:show], :unique => [:impressionable_id, :user_id]

  def index
    @photos = Photo.page(params[:page]).per(12)
    @user = User.find(current_user.id)
    if params[:tag_name]
      @photos = Photo.tagged_with("#{params[:tag_name]}").page(params[:page]).per(12)
    end
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
  	@photo.user_id = current_user.id
  	if @photo.save
  	  redirect_to photo_path(@photo.id)
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
    @comment = Comment.new
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photo_path(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path(current_user)
  end

  def likes
    @photo = Photo.find(params[:id])
    @likes = Like.where(photo_id: @photo.id).page(params[:page]).per(10)
  end

  def comments
    @photo = Photo.find(params[:id])
    @comments = Comment.where(photo_id: @photo.id).page(params[:page]).per(10)
  end

  def photo_params
  	params.require(:photo).permit(:user_id, :image, :word, :range, :tag_list)
  end
end
