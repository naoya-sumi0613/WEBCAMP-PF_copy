class Users::CommentsController < ApplicationController
  def create
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.photo_id = @photo.id
  	if @comment.save
      @photo.create_notification_comment!(current_user, @comment.id)
  	  redirect_to photo_comments_path
    else
      @user = User.find(@photo.user_id)
      render 'users/photos/show'
    end
  end

  def destroy
  	@comment = Comment.find_by(photo_id: params[:photo_id], id: params[:id])
  	@comment.destroy
  	redirect_to photo_comments_path
  end

  def update
  	@comment = Comment.find_by(photo_id: params[:photo_id], id: params[:id])
  	@comment.update_attributes(thanks: params[:thanks])
    @comment.create_notification_thanks!(current_user)
  end


  private
  def comment_params
  	params.require(:comment).permit(:comment, :thanks)
  end
end
