class ActPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin) || user.try(:super_admin?) || user.try(:agent?)
        scope.all
      elsif user.try(:venue?)
        scope.where("performances.venue_id = ?", user.venue_id)
      elsif user.try(:act?)
        scope.where(id: user.act_id)
      else
        scope.none
      end
    end
  end
end
