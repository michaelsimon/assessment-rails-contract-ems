class ActSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :size, :website
end
