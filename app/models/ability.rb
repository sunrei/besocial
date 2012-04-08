class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    can :update, User, :id => user.id
    can :delete, Post do |post|
      post.user.id == user.id or post.author.id == user.id
      end
    can :delete, Comment do |comment|
      comment.user_id == user.id or comment.post.user.id == user.id
    end
    if user.admin?
      can :manage, :all
    end
  end
end