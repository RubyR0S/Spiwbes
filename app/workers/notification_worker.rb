class NotificationWorker < ApplicationWorker
  def perform(user_id)
    user = User.find(user_id)
    NotificationWorker.perform_at(user: user)
  end
end