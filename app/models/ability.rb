class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all

    if user.admin?
      can :manage, :all
    else
      can :create, Post, user_id: user.id
      can %i[update destroy], Post, user_id: user.id
      can %i[create update destroy], Comment, user_id: user.id
    end
  end
end
