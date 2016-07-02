class Performance < ActiveRecord::Base
  belongs_to :act
  belongs_to :venue
  has_one :contract
  validates_presence_of :act_id, :venue_id, :name, :description, :perf_date
  validates :tkts_url, format: { with: URI.regexp }
  validate :check_perf_date

  def check_perf_date
    if perf_date.present?
      unless perf_date >= Date.today
        errors.add(:performance, "Performance date must be in the future.")
      end
    end
  end

  def performance_string
    "#{name} - #{venue.name} - #{perf_date}"
  end

end
