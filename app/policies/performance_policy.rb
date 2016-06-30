class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin)
        scope.all
      elsif user.try(:venue?)
        scope.where(venue_id: user.venue_id)
      elsif user.try(:act?)
        scope.where(act_id: user.act_id)
      else
        scope.none
      end
    end
  end

  def new?
    user.try(:is_admin)
  end

  def create?
    user.try(:is_admin)
  end

  def destroy?
    user.super_admin?
  end

  def edit?
    user.try(:is_admin)
  end

  def update?
    user.try(:is_admin)
  end

  def show?
    user.try(:is_admin) || (user.act? && user.act == record.act) || (user.venue? && user.venue == record.venue)
  end

  def index?
    user.present? && !user.role.nil?
  end

end
