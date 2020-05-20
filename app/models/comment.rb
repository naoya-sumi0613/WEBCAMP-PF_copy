class Comment < ApplicationRecord

  belongs_to :photo
  belongs_to :user
  has_many :notifications, dependent: :destroy

  def create_notification_thanks!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and comment_id = ? and action = ? ", current_user.id, user_id, id, 3])
    if temp.blank?
      notification = current_user.active_notifications.new(
        comment_id: id,
        photo_id: photo_id,
        visited_id: user_id,
        action: 'thanks'
      )
    notification.save if notification.valid?
    end
  end
end
