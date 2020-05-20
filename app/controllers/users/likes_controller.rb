class Users::LikesController < ApplicationController
  def create
      @photo = Photo.find(params[:photo_id])
      @like = current_user.likes.new(photo_id: @photo.id)
      @like.save
      @photo.create_notification_like!(current_user)
  end

  def destroy
      @photo = Photo.find(params[:photo_id])
      @like = current_user.likes.find_by(photo_id: @photo.id)
      @like.destroy
  end
end
