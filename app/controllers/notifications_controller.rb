class NotificationsController < ApiController
before_action :authorize_request

  def show
    notification = Notification.find(params[:id])
    render json: notification, status: :ok
  end

  def create
    notification = @current_user.notifications.new(notification_params)
    if notification.save
      render json: notification, status: :ok
    else
      render json: { errors: notification.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.permit(
      :title, :body
    )
  end
end