class User < ActiveRecord::Base
  belongs_to :role
  has_many :wall_entries, :class_name => "Post", :dependent => :destroy
  has_many :posts, :foreign_key => :author_id

  has_many :subscriptions
  has_many :leaders, :through => :subscriptions
  has_many :subscribers, :class_name => 'Subscription', :foreign_key => 'leader_id'
  has_many :followers, :through => :subscribers, :source => :user

  has_attached_file :avatar, :styles => { :normal => "200", :small => "50x50#" }, :default_url => '/assets/missing_:style.jpg'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nick, :status,
                  :first_name, :last_name, :gender, :birthday, :about, :avatar

  def admin?
    self.role && self.role.name == "admin"
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def subscribed_to?(user_id)
    self.leaders.exists?(user_id)
  end
end
