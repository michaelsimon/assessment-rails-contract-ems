class ContractPerformanceDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :perf_date, :perf_time, :tkts_url, :description
  has_one :act, serializer: PerformanceActSerializer
  has_one :venue, serializer: PerformanceVenueSerializer
end
