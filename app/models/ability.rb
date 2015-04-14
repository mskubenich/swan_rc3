class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :manage, User do |managed_user|
        managed_user.id == user.id or managed_user.new_record?
      end
    end

    if user.guest?

    end
  end
end
