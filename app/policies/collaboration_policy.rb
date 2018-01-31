class CollaborationPolicy < ApplicationPolicy

  def create?
    user.present? && user == record.user
  end

  def destroy?
    create?
  end
end