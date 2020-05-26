class Contact < ApplicationRecord
  default_scope -> { order(created_at: :desc)}
	enum status: { 未対応: false, 対応済: true }

  validates :title, presence: true, length: { maximum: 50}
  validates :content, presence: true, length: { maximum: 150}

	belongs_to :user
end
