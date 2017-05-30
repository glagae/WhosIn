class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def edit?
    create?
  end

  def update?
    # if the user is a manager then
    is_manager?
  end

   def destroy?
    is_manager?
  end

  private

  def is_manager?
    # get event, get list of managers, is the user in this list?
    record.managers.include? user
  end

end
