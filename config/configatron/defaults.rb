# Put all your default configatron settings here.

# Example:
#   configatron.emails.welcome.subject = 'Welcome!'
#   configatron.emails.sales_reciept.subject = 'Thanks for your order'
# 
#   configatron.file.storage = :s3
APN::App::RAILS_ENV = 'development'
configatron.apn.passphrase  = ''
configatron.apn.port  = 2195
configatron.apn.host  = 'gateway.sandbox.push.apple.com'
configatron.apn.cert = "#{Rails.root}/config/apns-dev.pem"