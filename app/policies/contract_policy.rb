class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:super_admin?) || user.try(:agent?)
        scope.all
      elsif user.try(:venue?)
        scope.joins(:performance).where("performances.venue_id = ?", user.venue_id)
      elsif user.try(:act?)
        scope.joins(:performance).where("performances.act_id = ?", user.act_id)
      else
        scope.none
      end
    end
  end

  def new?
    user.super_admin? || user.agent?
  end

  def create?
    user.super_admin? || user.agent?
  end

  def destroy?
    user.super_admin? || user.agent?
  end

  def edit?
    user.super_admin? || user.agent?
  end

  def update?
    user.super_admin? || user.agent?
  end

  def show?
    user.super_admin? || user.agent? || user.act? && user.act == record.performance.act || user.venue? && user.venue == record.performance.venue
  end

  def index?
    user.present? && !user.role.nil?
  end

end
