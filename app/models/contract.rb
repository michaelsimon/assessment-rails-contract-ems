class Contract < ActiveRecord::Base
  belongs_to :performance
  has_many :documents
  has_many :approvals

  validates_presence_of :performance_id, :status, :details
  validate :check_due_date

  def check_due_date
    if due_date < Date.today
      errors.add(:contract, "Due Date cannot be in the past.")
    end
  end

  def approvals_attributes=(approval_attributes)
    approval_attributes.values.each do |approval_attribute|

      if !approval_attribute[:user_id].blank?
        approval = Approval.find_or_initialize_by(approval_attribute)
        approval.status = "pending" if !approval.persisted?
        approval.save
        self.approvals << approval
      end
    end
  end

end
