class Article < ApplicationRecord
  include ArticleLinks

  belongs_to :user, optional: true
end
