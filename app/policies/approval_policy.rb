class ApprovalPolicy < ApplicationPolicy
  def approve?
    user.present? && (user.is_admin || (user.venue? && user.venue_id == record.contract.performance.venue_id) || (user.act? && user.act_id == record.contract.performance.act_id))
  end

  def reject?
    user.present? && (user.is_admin || (user.venue? && user.venue_id == record.contract.performance.venue_id) || (user.act? && user.act_id == record.contract.performance.act_id))
  end

  def cancel?
    user.present? && user.is_admin
  end

  def destroy?
    user.present? && user.super_admin?
  end


end
