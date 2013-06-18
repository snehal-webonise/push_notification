class User < ActiveRecord::Base
  attr_accessible :android_token, :apple_token, :name
end
