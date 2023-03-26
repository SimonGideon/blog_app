# frozen_string_literal: true

class Ability
  include CanCan::Ability

  class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        # Define abilities for non-admin users here
      end
    end
  end
  
end
