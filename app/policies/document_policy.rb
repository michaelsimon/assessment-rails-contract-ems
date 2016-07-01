class DocumentPolicy < ApplicationPolicy
  def new?
    user.present? && user.is_admin
  end

  def create?
    user.present? && user.is_admin
  end

  def destroy?
    user.super_admin?
  end

  def edit?
    user.present? && user.is_admin
  end

  def update?
    user.present? && user.is_admin
  end

  def show?
    user.present? && (user.is_admin || (user.act? && user.act == record.contract.performance.act) || (user.venue? && user.venue == record.contract.performance.venue))
  end

end
