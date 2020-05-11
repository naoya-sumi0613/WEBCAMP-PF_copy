class Contact < ApplicationRecord
	enum status: { 未対応: false, 対応済: true }

	belongs_to :user
end
