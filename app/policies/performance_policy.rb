class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.is_admin
        scope.all
      elsif user.present? && user.venue?
        scope.where(venue_id: user.venue_id)
      elsif user.present? && user.act?
        scope.where(act_id: user.act_id)
      else
        scope.none
      end
    end
  end

  def show?
    user.present? && (user.is_admin|| (user.act? && user.act == record.act) || (user.venue? && user.venue == record.venue))
  end

  def performance_detail?
    self.show?
  end

  def performances_listing?
    self.index?
  end

end
