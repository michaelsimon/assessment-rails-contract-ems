class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.is_admin
        scope.all
      elsif user.present? && user.venue?
        scope.joins(:performance).where("performances.venue_id = ?", user.venue_id)
      elsif user.present? && user.act?
        scope.joins(:performance).where("performances.act_id = ?", user.act_id)
      else
        scope.none
      end
    end
  end

  def show?
    user.present? && (user.is_admin || (user.act? && user.act == record.performance.act) || (user.venue? && user.venue == record.performance.venue))
  end

  def contract_detail?
    self.show?
  end


end
