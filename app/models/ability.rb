class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.manager?
      can :manage, :all
    elsif user.admin?
      can :manage, :all
      cannot :update, User
      cannot :destroy, User do |account|
        account.admin?
      end
    else
      can :read, :all
    end
  end
end
