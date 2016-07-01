class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.is_admin
        scope.all
      else
        scope.none
      end
    end
  end

  def destroy?
    user.present? && user.is_admin
  end

  def edit?
    user.present? && user.is_admin
  end

  def update?
    user.present? && user.is_admin
  end

  def index?
    user.present? && user.is_admin
  end

  def show?
    user.present? && user.is_admin
  end
end
