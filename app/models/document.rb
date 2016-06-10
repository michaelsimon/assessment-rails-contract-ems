class Document < ActiveRecord::Base
  belongs_to :contract
  validates_presence_of :name, :description
  validates :location, presence: true, format: { with: URI.regexp }
end
