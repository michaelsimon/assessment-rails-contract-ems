class Contract < ActiveRecord::Base
  belongs_to :performance
  has_many :documents
  has_many :approvals

  def approvals_attributes=(approval_attributes)  ##instead of  accepts_nested_attributes_for
    approval_attributes.values.each do |approval_attribute|

      if !approval_attribute[:user_id].blank?
        approval = Approval.find_or_create_by(approval_attribute)
        binding.pry
        self.approvals << approval
      end
    end
  end

end
