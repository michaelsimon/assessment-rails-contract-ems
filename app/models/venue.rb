class Venue < ActiveRecord::Base
  has_many :users
  has_many :performances
  has_many :contracts, through: :performances
end
