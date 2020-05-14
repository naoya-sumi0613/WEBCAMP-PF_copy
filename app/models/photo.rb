class Photo < ApplicationRecord
	enum range: { 全ユーザー: 0, フォロワーのみ: 1, 自分のみ: 2 }

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

  attachment :image
end
