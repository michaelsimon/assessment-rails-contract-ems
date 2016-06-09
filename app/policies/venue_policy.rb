class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin) || user.try(:super_admin?) || user.try(:agent?)
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
    user.is_admin == true || user.super_admin? || user.agent?
  end

  def create?
    user.is_admin == true || user.super_admin? || user.agent?
  end

  def destroy?
    user.is_admin == true || user.super_admin?
  end

  def edit?
    user.is_admin == true || user.super_admin? || user.agent? || user.venue? && user.venue == record
  end

  def update?
    user.is_admin == true || user.super_admin? || user.agent? || user.venue? && user.venue == record
  end

  def show?
    user.is_admin == true || user.super_admin? || user.agent? || user.venue? && user.venue == record || user.act? && record.performances.map {|r| r.act_id}.include?(user.act_id)
  end

  def index?
    user.present? && !user.role.nil?
  end
end
