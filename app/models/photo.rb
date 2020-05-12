class Photo < ApplicationRecord
	enum range: { 全ユーザー: 0, フォロワーのみ: 1, 自分のみ: 2 }

	belongs_to :user
  attachment :image
end
