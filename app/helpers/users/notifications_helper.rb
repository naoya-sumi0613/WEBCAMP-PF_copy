module Users::NotificationsHelper
  def notifications_count
    @notifications = current_user.passive_notifications.where(checked: false).count
  end
end
