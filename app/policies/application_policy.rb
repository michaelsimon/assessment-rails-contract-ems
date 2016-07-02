class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.present? && !user.role.nil?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present? && user.is_admin
  end

  def new?
    create?
  end

  def update?
    user.present? && user.is_admin
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.super_admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
