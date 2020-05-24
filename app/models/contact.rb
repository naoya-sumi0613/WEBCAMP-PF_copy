class Contact < ApplicationRecord
	enum status: { 未対応: false, 対応済: true }

  validates :title, length: { maximum: 50}
  validates :content, presence: true, length: { maximum: 150}

	belongs_to :user
end
