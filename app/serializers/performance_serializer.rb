class PerformanceSerializer < ActiveModel::Serializer
  attributes :id, :name, :perf_date, :perf_time, :tkts_url, :description
  has_one :contract
  has_one :venue
  has_one :act
end
