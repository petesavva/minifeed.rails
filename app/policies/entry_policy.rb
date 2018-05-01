class EntryPolicy < ApplicationPolicy
  def list?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: current_user)
    end
  end
end
