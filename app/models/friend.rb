class Friend < ApplicationRecord

  def self.fb_friends(user)
    # access_token and other values aren't required if you set the defaults as described above
    fb_friends = []
    if user.facebook.access_token.nil?
        fb_friends
    else
      fb_friends = current_user.facebook.get_connection("me","friends").map do |friend|
      friend["name"]
      end
    end
  end
end
