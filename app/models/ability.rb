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
      can :create, Suggestion
      can :destroy, Suggestion do |suggestion|
        suggestion.status == Settings.status.processing 
      end
      can :edit, User do |user_account|
        user_account == user
      end
    end
  end
end
