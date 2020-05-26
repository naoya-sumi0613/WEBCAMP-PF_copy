class Admins::HomeController < ApplicationController
  before_action :authenticate_admin!

  def top
    @users = User.all
    @users_today = User.where(created_at: Time.zone.now.all_day)
    @photos = Photo.all
    @photos_today = Photo.where(created_at: Time.zone.now.all_day)
    @contacts = Contact.where(status: "未対応")
  end
end
