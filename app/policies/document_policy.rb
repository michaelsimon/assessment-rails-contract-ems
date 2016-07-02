class DocumentPolicy < ApplicationPolicy

  def show?
    user.present? && (user.is_admin || (user.act? && user.act == record.contract.performance.act) || (user.venue? && user.venue == record.contract.performance.venue))
  end

end
