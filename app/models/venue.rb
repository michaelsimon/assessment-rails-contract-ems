class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :performances
  has_many :contracts, through: :performances
end
