class User < ActiveRecord::Base
 has_many :audits
 belongs_to :courtstation
class << self
  def current_user=(user)
    Thread.current[:current_user] = user
  end

  def current_user
    Thread.current[:current_user]
  end

end
validates :username, :uniqueness => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :courtstation_id,:email, :password, :password_confirmation, :remember_me, :username, :pj ,:mobile
  # attr_accessible :title, :body

scope :station, lambda { |userstation| where("courtstation"=> User.current_user.station)}
end
