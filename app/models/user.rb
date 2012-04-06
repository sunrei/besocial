class User < ActiveRecord::Base
  has_one :role
  has_many :wall_entries, :class_name => "Post", :dependent => :destroy
  has_many :posts, :foreign_key => :author_id

  has_attached_file :avatar, :styles => { :normal => "200", :small => "50x50#" }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nick, :status,
                  :first_name, :last_name, :gender, :birthday, :about, :avatar


end
