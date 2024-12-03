class ArticleBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :content

  view :show do
    field :links do |article, _options|
      article.show_links
    end
  end

  view :index do
    field :links do |article, _options|
      article.index_links
    end
  end
end
