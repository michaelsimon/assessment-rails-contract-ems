class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :contract_id, :name, :description, :location
end
