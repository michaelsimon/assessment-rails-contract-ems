class Performance < ActiveRecord::Base
  belongs_to :act
  belongs_to :venue
  has_one :contract

  def performance_string
    "#{name} - #{venue.name} - #{perf_date}"
  end
end
