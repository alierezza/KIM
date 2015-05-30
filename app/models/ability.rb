class Ability
  include CanCan::Ability

  def initialize(user)
    

    if user.role == "User" #user biasa
        can :read_kim, User, :id => user.id
        can :show_kim, User, :id => user.id
        can :create_kim, User, :id => user.id
        can :update_kim, User, :id => user.id
        can :destroy_kim, User, :id => user.id


    elsif user.role == "Admin"
        can :show_kim, User
        can :update_kim, User

        can :user_approval, User
        can :kim_approval, User


    elsif user.role == "SuperAdmin"
        can :create_admin, User
        can :create_crew, User


    elsif user.role == "Crew"




    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
