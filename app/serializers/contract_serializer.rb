class ContractSerializer < ActiveModel::Serializer
  attributes :id, :performance_id, :submit_date, :due_date, :status, :details
  has_one :performance, serializer: ContractPerformanceDetailSerializer
  has_many :documents, serializer: DocumentSerializer
end
