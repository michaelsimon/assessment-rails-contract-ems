class ApprovalPolicy < ApplicationPolicy
  def approve?
    user.is_admin == true || user.super_admin? || user.agent? || user.venue? && user.venue_id == record.contract.performance.venue_id || user.act? && user.act_id == record.contract.performance.act_id
  end

  def cancel?
    user.is_admin == true || user.super_admin? || user.agent?
  end

  def destroy?
    user.is_admin == true || user.super_admin?
  end


end
