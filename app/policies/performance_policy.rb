class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.is_admin
        scope.all
      elsif user.present? && user.venue?
        scope.where(venue_id: user.venue_id)
      elsif user.present? && user.act?
        scope.where(act_id: user.act_id)
      else
        scope.none
      end
    end
  end

  def new?
    user.present? && user.is_admin
  end

  def create?
    user.present? && user.is_admin
  end

  def destroy?
    user.present? && user.super_admin?
  end

  def edit?
    user.present? && user.is_admin
  end

  def update?
    user.present? && user.is_admin
  end

  def show?
    user.present? && (user.is_admin|| (user.act? && user.act == record.act) || (user.venue? && user.venue == record.venue))
  end

  def index?
    user.present? && !user.role.nil?
  end

end
