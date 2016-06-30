class DocumentPolicy < ApplicationPolicy
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
    user.try(:is_admin)
  end

  def update?
    user.try(:is_admin)
  end

  def show?
    user.try(:is_admin) || (user.act? && user.act == record.contract.performance.act) || (user.venue? && user.venue == record.contract.performance.venue)
  end

end
