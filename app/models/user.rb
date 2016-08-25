class User < ActiveRecord::Base
  enum role: [:unassigned, :agent, :act, :venue, :super_admin]
  has_many :approvals
  has_many :identities
  belongs_to :venue
  belongs_to :act
  validates_presence_of :name, :email
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
  validate :user_venue_has_venue_id
  validate :user_act_has_act_id
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :inactive
    else
      super # Use whatever other message
    end
  end

  def user_venue_has_venue_id
    if self.try(:role) == 'venue'
      unless !venue_id.nil?
        errors.add(:user, "Venue user does not have a venue associated.")
      end
    end
  end

  def user_act_has_act_id
    if self.try(:role) == 'act'
      unless !act_id.nil?
        errors.add(:user, "Act user does not have an Act associated.")
      end
    end
  end

  def is_admin
    role == "super_admin" || role == "agent"
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    # If user is already signed-in, use that resource
    user = signed_in_resource ? signed_in_resource : identity.user
    # # Create the user if needed
    # if user.nil?
    #   email = auth.info.email
    #   user = User.where(:email => email).first if email
    #   # Create the user if it's a new registration
    #   if user.nil?
    #     user = User.new(
    #     name: auth.extra.raw_info.name,
    #     email: email,
    #     password: Devise.friendly_token[0,20]
    #     )
    #     user.save
    #   end
    # end
    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user if auth.info.email == user.email
      identity.save!
    end
    user
  end
end
