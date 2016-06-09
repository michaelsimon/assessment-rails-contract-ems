class DocumentPolicy < ApplicationPolicy
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
    user.is_admin == true || user.super_admin? || user.agent?
  end

  def update?
    user.is_admin == true || user.super_admin? || user.agent?
  end

  def show?
    user.is_admin == true || user.super_admin? || user.agent? || user.act? && user.act == record.contract.performance.act || user.venue? && user.venue == record.contract.performance.venue
  end

end
