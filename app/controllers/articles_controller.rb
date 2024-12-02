class ArticlesController < ApplicationController
  def index
    articles = Article.all

    rendered_articles = ArticleBlueprint.render_as_hash(articles, view: :index)
    @html_content = render_to_string(partial: 'list', locals: { articles: rendered_articles })
    @links = ArticleLinks.general_index

    respond_to do |format|
      format.html { render :index }
      format.json { render json: { article: @html_content } }
    end
  end

  def show
    article = Article.find(params[:id])

    rendered_article = ArticleBlueprint.render_as_hash(article, view: :show)
    @html_content = render_to_string(partial: 'article', locals: { article: rendered_article })

    respond_to do |format|
      format.html { render :show }
      format.json { render json: { article: @html_content } }
    end
  end
end
