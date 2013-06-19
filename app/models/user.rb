class User < ActiveRecord::Base
  attr_accessible :android_token, :apple_token, :name
  def create_device params
    if params[:apple_token].present? && !APN::Device.find_by_token(params[:apple_token]).present?
      device = APN::Device.create
      device.token = params[:apple_token]
      device.app_id = APN::App.first.id
      device.save
    elsif params[:android_token].present? && !Gcm::Device.find_by_registration_id(params[:android_token]).present?
      Gcm::Device.create(:registration_id => params[:android_token])
    end
  end

  def self.create_app
    app = APN::App.new
    app.apn_dev_cert = File.read("/home/webonise/workspace/push_notification_app/config/apns-dev.pem")
    app.save
  end
end
