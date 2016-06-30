class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin)
        scope.all
      elsif user.try(:venue?)
        scope.where(id: user.venue_id)
      elsif user.try(:act?)
        scope.joins(:performances).where("performances.act_id = ?", user.act_id).distinct
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
    user.try(:is_admin) || (user.venue? && user.venue == record)
  end

  def update?
    user.try(:is_admin) || (user.venue? && user.venue == record)
  end

  def show?
    user.try(:is_admin) || (user.venue? && user.venue == record) || (user.act? && record.performances.map {|r| r.act_id}.include?(user.act_id))
  end

  def index?
    user.present? && !user.role.nil?
  end
end
