class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin) || user.try(:super_admin?) || user.try(:agent?)
        scope.all
      elsif user.try(:venue?)
        scope.joins(:performance).where("performances.venue_id = ?", user.venue_id)
      elsif user.try(:act?)
        scope.joins(:performance).where("performances.act_id = ?", user.act_id)
      else
        scope.none
      end
    end
  end
end
