class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin? || article.user_id == user.id
  end

  def update?
    user.admin? || article.user_id == user.id
  end

  def destroy?
    user.admin? || article.user_id == user.id
  end
end
