class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :leader, :class_name => "User"

  validates_presence_of :user_id,:leader_id
  validates_existence_of :leader
  validates_uniqueness_of :leader_id, :scope => :user_id
  validate :cannot_subscribe_to_self

  def cannot_subscribe_to_self
    errors.add(:base, "You cannot subscribe to yourself") if user_id == leader_id
  end
end