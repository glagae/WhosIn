class Friend < ApplicationRecord

  def self.fb_friends(user)
    # access_token and other values aren't required if you set the defaults as described above
    fb_friends = []
    if user.facebook.access_token.nil?
        fb_friends
    else
      fb_friend_id = user.facebook.get_connection("me","friends")
    end
  end

  def self.fb_friend_users(user)
    ids = self.fb_friends(user).map do |fb_friend|
      fb_friend["id"]

      # [{"name"=>"Gauth Lag", "id"=>"10158941048160637"}]
    end
    User.where(uid: ids)
  end
end
