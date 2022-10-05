require 'time'
require 'onesignal'

rest_api_key = 'ZjMwNjQ4ZmEtYzI0Ni00OTFmLTlmNmQtNDMyNGRmMDg0ODJl'
app_id = '9bfd151f-4790-4442-9377-40c5fdec2d93'

# setup authorization
OneSignal.configure do |config|
  # Configure Bearer authorization: app_key
  config.app_key = rest_api_key
end

api_instance = OneSignal::DefaultApi.new

begin
  # Create notification
  notification = OneSignal::Notification.new({ app_id: app_id }) # Notification
  notification.contents = OneSignal::StringMap.new({ "en": 'Hello MAZAFAKA!'})
  notification.included_segments = ['Subscribed Users']
  p notification

  result = api_instance.create_notification(notification)
  p result
rescue OneSignal::ApiError => e
  puts "Error when calling DefaultApi->create_notification: #{e}"
end
