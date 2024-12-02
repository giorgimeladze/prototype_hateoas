class ArticleBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :content

  view :show do
    field :links do |article, _options|
      ArticleLinks.show(article)
    end
  end

  view :index do
    field :links do |article, _options|
      ArticleLinks.index(article)
    end
  end
end
