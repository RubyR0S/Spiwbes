class NotificationWorker < ApplicationWorker
  def perform(user_id)
    user = User.find(user_id)

    # TODO: Create logic for push notifications
    pp user
  end
end