class API::NotificationsController < APIController

  def index
    @notification = Notification.all
    render json: @notification, serializer: NotificationsCollectionSerializer, each_serializer: NotificationSerializer, root: false
  end
  
end