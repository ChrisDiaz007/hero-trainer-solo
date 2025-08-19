class BookingPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def update?
    return user.present? && record.lesson.user == user
  end
end
