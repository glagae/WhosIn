class FriendPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def fb_friends?
      true
    end
  end
end
