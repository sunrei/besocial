class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => :author_id
  belongs_to :user

  has_many :pictures, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates_existence_of :user
  validates_existence_of :author

  #validates_length_of :message, :minimum => 1, :too_short => "please enter at least 1 character"

  accepts_nested_attributes_for :pictures

  default_scope order("updated_at desc")
end