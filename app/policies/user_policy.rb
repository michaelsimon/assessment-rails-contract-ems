class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin)
        scope.all
      else
        scope.none
      end
    end
  end

  def destroy?
    user.try(:is_admin)
  end

  def edit?
    user.try(:is_admin)
  end

  def update?
    user.try(:is_admin)
  end

  def index?
    user.try(:is_admin)
  end
end
