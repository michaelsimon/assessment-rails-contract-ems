class Venue < ActiveRecord::Base
  has_many :users
  has_many :performances
  has_many :contracts, through: :performances
  validates_presence_of :name, :address, :city, :state, :zipcode, :phone
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :website, format: { with: URI.regexp }
end
