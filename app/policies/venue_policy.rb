class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:super_admin?) || user.try(:agent?)
        scope.all
      elsif user.try(:venue?)
        scope.where(id: user.venue_id)
      elsif user.try(:act?)
        scope.joins(:performances).where("performances.act_id = ?", user.act_id)
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
    user.super_admin?
  end

  def edit?
    user.super_admin? || user.agent? || user.venue? && user.venue == record
  end

  def update?
    user.super_admin? || user.agent? || user.venue? && user.venue == record
  end

  def show?
    user.super_admin? || user.agent? || user.venue? && user.venue == record || user.act? && record.performances.map {|r| r.act_id}.include?(user.act_id)
  end

  def index?
    user.present? && !user.role.nil?
  end
end
