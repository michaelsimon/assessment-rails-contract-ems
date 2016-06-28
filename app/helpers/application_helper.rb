module ApplicationHelper
  def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}"
  end

  def options_for_role
    [["Unassigned", "unassigned"],["Agent", "agent"],["Act", "act"], ["Venue", "venue"], ["Super Admin", "super_admin"]]
  end

  def options_for_contract_status
    [["Pending", "pend"], ["Submitted", "submit"], ["Approved", "app"], ["Fulfilled", "ff"], ["Cancelled", "cancel"]]
  end

  def fmatdate(date)
    date.strftime("%a %m/%d/%Y")
  end

  def fmattime(date)
    date.strftime("%I:%M %p")
  end

end
