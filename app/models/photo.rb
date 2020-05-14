class Photo < ApplicationRecord
	enum range: { 全ユーザー: 0, フォロワーのみ: 1, 自分のみ: 2 }

	belongs_to :user
	has_many :comments, dependent: :destroy
  attachment :image
end
