class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.is_admin
        scope.all
      elsif user.present? && user.venue?
        scope.joins(:performance).where("performances.venue_id = ?", user.venue_id)
      elsif user.present? && user.act?
        scope.joins(:performance).where("performances.act_id = ?", user.act_id)
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
    user.present? && (user.is_admin || (user.act? && user.act == record.performance.act) || (user.venue? && user.venue == record.performance.venue))
  end

  def index?
    user.present? && !user.role.nil?
  end

end
