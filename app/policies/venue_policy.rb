class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin) || user.try(:super_admin?) || user.try(:agent?)
        scope.all
      elsif user.try(:venue?)
        scope.where(id: user.venue_id)
      elsif user.try(:act?)
        scope.joins(:performances).where("performances.act_id = ?", user.act_id)
      else
        scope.none
      end
    end
  end
end
