class Contact < ApplicationRecord
	enum status: { 未対応: false, 対応済: true }

  validates :content, presence: true, length: { maximum: 150}

	belongs_to :user
end
