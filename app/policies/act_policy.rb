class ActPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.is_admin
        scope.all
      elsif user.present? && user.venue?
        scope.joins(:performances).where("performances.venue_id = ?", user.venue_id).distinct
      elsif user.present? && user.act?
        scope.where(id: user.act_id)
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
    user.present? && (user.is_admin || (user.act? && user.act == record))
  end

  def update?
    user.present? && (user.is_admin || (user.act? && user.act == record))
  end

  def show?
    user.present? && (user.is_admin || (user.act? && user.act == record) || (user.venue? && record.performances.map {|r| r.venue_id}.include?(user.venue_id)))
  end

  def index?
    user.present? && !user.role.nil?
  end

end
