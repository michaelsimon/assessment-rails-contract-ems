class Act < ActiveRecord::Base
  belongs_to :user
  has_many :performances
  has_many :contracts, through: :performances

  validates_presence_of :name, :description, :location, :size
  validates :website, presence: true, format: { with: URI.regexp }

  def num_of_performances
    performances.count
  end
end
