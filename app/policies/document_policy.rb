class DocumentPolicy < ApplicationPolicy
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
    user.is_admin || (user.act? && user.act == record.contract.performance.act) || (user.venue? && user.venue == record.contract.performance.venue)
  end

end
