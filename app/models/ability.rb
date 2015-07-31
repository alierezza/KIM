class Ability
  include CanCan::Ability

  def initialize(user)
    

    if user.role == "User" #user biasa
        can :read_kim, User, :id => user.id
        can :show_kim, User, :id => user.id
        can :create_kim, User, :id => user.id
        can :update_kim, User, :id => user.id
        can :destroy_kim, User, :id => user.id

        can :create_feedback, User
        can :create_lkp, User
        can :edit_info, User, :id => user.id


    elsif user.role == "Admin"
        can :user_approval, User

        can :edit_info, User, :id => user.id
        

        #kim
        can :generate_kim, User
        can :kim_approval, User
        

    elsif user.role == "SuperAdmin"
        can :create_admin, User
        can :create_crew, User

        can :edit_info, User, :id => user.id

        #kim
        can :show_kim, User
        can :kim_approval, User
        can :update_kim, User

        #LKP
        can :view_lkp, User

        #survei
        can :view_feedback, User

        #best of the month
        can :best_of_the_month, User

    elsif user.role == "Crew"

        can :kim_approval_by_crew, User

        can :edit_info, User, :id => user.id


    end
  end
end
