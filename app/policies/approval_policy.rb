class ApprovalPolicy < ApplicationPolicy
  def approve?
    user.is_admin || (user.venue? && user.venue_id == record.contract.performance.venue_id) || (user.act? && user.act_id == record.contract.performance.act_id)
  end

  def reject?
    user.is_admin || (user.venue? && user.venue_id == record.contract.performance.venue_id) || (user.act? && user.act_id == record.contract.performance.act_id)
  end

  def cancel?
    user.is_admin
  end

  def destroy?
    user.super_admin?
  end


end
