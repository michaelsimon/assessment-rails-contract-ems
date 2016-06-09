class Contract < ActiveRecord::Base
  belongs_to :performance
  has_many :documents
  has_many :approvals

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
