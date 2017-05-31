require 'koala'
class FriendsController < ApplicationController
  def index
  end

  def fb_friends
    # access_token and other values aren't required if you set the defaults as described above
    @fb_friends = current_user.facebook.get_connection("me","friends")
  end
end
