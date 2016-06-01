class Contract < ActiveRecord::Base
  belongs_to :performance
  has_many :approvals

end
