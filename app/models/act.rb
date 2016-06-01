class Act < ActiveRecord::Base
  has_many :performances
  has_many :contracts, through: :performances
end
