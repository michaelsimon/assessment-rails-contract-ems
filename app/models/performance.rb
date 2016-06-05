class Performance < ActiveRecord::Base
  belongs_to :act
  belongs_to :venue
  has_one :contract

  def performance_string
    "#{name} - #{venue.name} - #{perf_date}"
  end

  def fmatdate
    perf_date.strftime("%a %m/%d/%Y")
  end

  def fmattime
    perf_time.strftime("%I:%M %p")
  end

end
