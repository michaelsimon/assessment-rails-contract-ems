class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_admin
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
    user.is_admin
  end

  def create?
    user.is_admin
  end

  def destroy?
    user.super_admin?
  end

  def edit?
    user.is_admin
  end

  def update?
    user.is_admin
  end

  def show?
    user.is_admin || (user.act? && user.act == record.performance.act) || (user.venue? && user.venue == record.performance.venue)
  end

  def index?
    user.present? && !user.role.nil?
  end

end
