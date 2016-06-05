class User < ActiveRecord::Base
  enum role: [:unassigned, :agent, :act, :venue, :super_admin]
  has_many :approvals
  belongs_to :venue
  belongs_to :act

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:omniauthable
end
