class Approval < ActiveRecord::Base
  belongs_to :contract
  belongs_to :user

  validates_presence_of :status

  def mark_approved
    self.status = "approved"
    self.date_answered = Time.now
    self.save
  end

  def mark_cancelled
    self.status = "cancelled"
    self.date_answered = Time.now
    self.save
  end

  def mark_rejected
    self.status = "rejected"
    self.date_answered = Time.now
    self.save
  end
  
end
