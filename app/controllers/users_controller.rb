class UsersController < ApplicationController
 include CreateNotification

  def new

  end

  def create_new_user

  end

  def flight_stat_apn_response
    msg = get_flight_details
    user = User.all
    user.each do|user|
      if !user.apple_token.nil?
        device = APN::Device.find_by_token(user.apple_token)
        notification = APN::Notification.new
        notification.device = device
        notification.badge = 5
        notification.sound = true
        notification.alert = msg
        notification.save
        APN::App.send_notifications
      end
      if !user.android_token.nil?
        flight_stat_android_response msg,user
      end
    end
    flash[:notice] = 'Notification sent successfully!'
    render :action => "new"
  end

  def flight_stat_android_response msg,user
    device = Gcm::Device.find_by_registration_id(user.android_token)
    notification = Gcm::Notification.new
    notification.device = device
    notification.collapse_key = "updates_available"
    notification.delay_while_idle = true
    notification.data = {:registration_ids => [user.android_token], :data => {:message_text => msg}}
    notification.save
    Gcm::Notification.send_notifications
  end
end
