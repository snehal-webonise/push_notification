# Override your default settings for the Development environment here.
# 
# Example:
#   configatron.file.storage = :local
APN::App::RAILS_ENV = 'development'
configatron.apn.passphrase  = ''
configatron.apn.port  = 2195
configatron.apn.host  = 'gateway.sandbox.push.apple.com'
configatron.apn.cert = "/home/webonise/workspace/push_notification_app/config/apns-dev.pem"
