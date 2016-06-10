class DocumentPolicy < ApplicationPolicy
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
    user.super_admin? || user.agent?
  end

  def update?
    user.super_admin? || user.agent?
  end

  def show?
    user.super_admin? || user.agent? || user.act? && user.act == record.contract.performance.act || user.venue? && user.venue == record.contract.performance.venue
  end

end
