class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :comment
  default_scope order("created_at asc")
end