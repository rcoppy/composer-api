# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
    guest_user = false

    if user == nil
      guest_user = true
      user = User.new
    end

    if user.is_admin
      can :manage, :all
    elsif user.is_curator
      can [:read, :show], :all
      can :create, App
      can :create, ApplicationComment
      can :create, Decision
      can [:update, :delete], ApplicationComment, author_id_id: user.id # need to filter via application author at controller level 
      can [:update, :delete], Decision, author_id_id: user.id # filter local
      can :create, GenreScore # filter local
      can :create, Genre
      can :create, Rating
      can [:update, :delete], Rating, author_id_id: user.id
      can :create, ScoreComment
      can :create, ScoreTag
      can :manage, Score, author_id_id: user.id
      can :create, Tag
      can :update, User, id: user.id
    elsif !guest_user
      can :create, App
      can [:read, :show], App, author_id_id: user.id
      can :read, ApplicationComment # need to filter via application author at controller level 
      can :read, Decision # filter local
      can [:read, :create, :show], GenreScore # filter local
      can [:read, :show], Genre
      can [:read, :show], Rating
      can [:read, :show], ScoreComment
      can [:read, :create, :show], ScoreTag
      can :create, Score, author_id_id: user.id
      can [:read, :create, :show], Tag
      can :update, User, id: user.id
      can [:read, :show], User
    else
      can [:read, :show], User
    end
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