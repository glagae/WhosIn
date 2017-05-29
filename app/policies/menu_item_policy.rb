class MenuItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    # if the user is a manager then
    is_manager?
  end

  def update?
    # any guest that attends can update the status of the item by clicking bring
    is_manager?
  end

  def destroy?
    # if the user is a manager then
    is_manager?
  end

  private

  def is_manager?
    # get event, get list of managers, is the user in this list?
    record.event.managers.include? user
  end
end
