class CollaborationPolicy < ApplicationPolicy

  def create?
    @user.present? && @user == @record.wiki.user
  end

  def destroy?
    create?
  end
end