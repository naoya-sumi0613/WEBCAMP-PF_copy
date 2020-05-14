class Users::CommentsController < ApplicationController
  def create
  	photo = Photo.find(params[:photo_id])
  	comment = Comment.new(comment_params)
  	comment.user_id = current_user.id
  	comment.photo_id = photo.id
  	comment.save
  	redirect_to photo_comments_path
  end

  def index
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.where(photo_id: params[:photo_id])
  end

  def destroy
  	@comment = Comment.find_by(photo_id: params[:photo_id], id: params[:id])
  	@comment.destroy
  	redirect_to photo_comments_path
  end

  def update
  	@comment = Comment.find_by(photo_id: params[:photo_id], id: params[:id])
  	@comment.update_attributes(thanks: params[:thanks])
  	redirect_to photo_comments_path
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment, :thanks)
  end
end
