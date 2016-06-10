class ActPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:super_admin?) || user.try(:agent?)
        scope.all
      elsif user.try(:venue?)
        scope.where("performances.venue_id = ?", user.venue_id)
      elsif user.try(:act?)
        scope.where(id: user.act_id)
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
    user.super_admin? || user.agent? || user.act? && user.act == record
  end

  def update?
    user.super_admin? || user.agent? || user.act? && user.act == record
  end

  def show?
    user.super_admin? || user.agent? || user.act? && user.act == record || user.venue? && record.performances.map {|r| r.venue_id}.include?(user.venue_id)
  end

  def index?
    user.present? && !user.role.nil?
  end

end
