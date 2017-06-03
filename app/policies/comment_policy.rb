class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    is_guest?
  end

  def destroy?
    is_comment_owner?
  end

  private

  def is_guest?
    record.event.guests.include? user
  end

  def is_comment_owner?
    record.invitation.user == user
  end
end
