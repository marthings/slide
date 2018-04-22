class PresentationPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def update?
    user.present? && user == presentation.user
  end

  def destroy?
    user.present? && user == presentation.user
  end

  private
    def presentation
      record
    end

end
