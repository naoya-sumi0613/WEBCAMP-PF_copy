class Photo < ApplicationRecord
	default_scope -> { order(created_at: :desc)}
  enum range: { 全ユーザー: 0, フォロワーのみ: 1, 自分のみ: 2 }

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

  has_many :notifications, dependent: :destroy
  # いいね通知
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and photo_id = ? and action = ?", current_user.id, user_id, id, 0])
    # いいねされてない場合のみ通知
    if temp.blank?
      notification = current_user.active_notifications.new(
        photo_id: id,
        visited_id: user_id,
        action: 'like'
      )
      notification.save if notification.valid?
    end
  end

  # コメント通知
  def create_notification_comment!(current_user, comment_id)
    notification = current_user.active_notifications.new(
      photo_id: id,
      comment_id: comment_id,
      visited_id: user_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントは通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


  attachment :image

  acts_as_taggable #タグ付け
  is_impressionable counter_cache: true #閲覧数
end
