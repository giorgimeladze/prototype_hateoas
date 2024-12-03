class ArticlesController < ApplicationController
  include LinksRenderer

  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  def index
    articles = Article.all

    rendered_articles = ArticleBlueprint.render_as_hash(articles, view: :index)
    @html_content = render_to_string(partial: 'list', locals: { articles: rendered_articles })
    @links = ArticleLinks.general_index

    respond_to do |format|
      format.html { render :index }
      format.json { render json: { articles: rendered_articles, links: @links } }
    end
  end

  # GET /articles/:id
  def show
    rendered_article = ArticleBlueprint.render_as_hash(@article, view: :show)
    @html_content = render_to_string(partial: 'article', locals: { article: rendered_article })

    respond_to do |format|
      format.html { render :show }
      format.json { render json: { article: @html_content } }
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
    @html_content = render_to_string(partial: 'form', locals: { article: @article })
    respond_to do |format|
      format.html { render :new }
      format.json { render json: {form: @html_content } }
    end
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      respond_to do |format|
        format.html { redirect_to article_path(@article), notice: 'Article was successfully created.' }
        format.json { render json: { success: true, article: @article }, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { success: false, errors: @article.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # GET /articles/:id/edit
  def edit
    @html_content = render_to_string(partial: 'form', locals: { article: @article })
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: { form: @html_content } }
    end
  end

  # PATCH/PUT /articles/:id
  def update
    if @article.update(article_params)
      respond_to do |format|
        format.html { redirect_to article_path(@article), notice: 'Article was successfully updated.' }
        format.json { render json: { success: true, article: @article }, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { success: false, errors: @article.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'Article was successfully deleted.' }
      format.json { render json: { success: true, message: 'Article was successfully deleted.' }, status: :ok }
    end
  end

  private

  # Strong parameters
  def article_params
    params.require(:article).permit(:title, :content)
  end

  # Find article by ID
  def set_article
    @article = Article.find(params[:id])
  end
end
