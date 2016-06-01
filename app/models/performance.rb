class Performance < ActiveRecord::Base
  belongs_to :act
  belongs_to :venue
  has_one :contract
end
