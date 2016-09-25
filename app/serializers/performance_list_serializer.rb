class PerformanceListSerializer < ActiveModel::Serializer
  attributes :id, :name, :perf_date, :perf_time, :act, :venue
  has_one :act, serializer: PerformanceActSerializer
  has_one :venue, serializer: PerformanceVenueSerializer
end
