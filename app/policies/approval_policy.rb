class ApprovalPolicy < ApplicationPolicy
  def approve?
    user.super_admin? || user.agent? || user.venue? && user.venue_id == record.contract.performance.venue_id || user.act? && user.act_id == record.contract.performance.act_id
  end

  def cancel?
    user.super_admin? || user.agent?
  end

  def destroy?
    user.super_admin?
  end


end
