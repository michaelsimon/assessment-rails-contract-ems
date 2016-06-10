class User < ActiveRecord::Base
  enum role: [:unassigned, :agent, :act, :venue, :super_admin]
  has_many :approvals
  has_one :identity
  belongs_to :venue if :role => :venue
  belongs_to :act if :role => :act
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_oauth(auth, signed_in_resource = nil)
   # Get the identity and user if they exist
   identity = Identity.find_for_oauth(auth)
   # If user is already signed-in, use that resource
   user = signed_in_resource ? signed_in_resource : identity.user
   # Create the user if needed
   if user.nil?
     email = auth.info.email
     user = User.where(:email => email).first if email
     # Create the user if it's a new registration
     if user.nil?
       user = User.new(
         name: auth.extra.raw_info.name,
         email: email,
         password: Devise.friendly_token[0,20]
       )
       user.save
     end
   end
   # Associate the identity with the user if needed
   if identity.user != user
     identity.user = user if auth.info.email == user.email
     identity.save!
   end
   user
 end
end
