class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
