class ArticlesController < ApplicationController

  before_action(:set_article, only: [:show, :edit, :update, :destroy])
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      flash[:errors] = "Please try again!"
      render(:new)
    end
  end

  def destroy
    @article.destroy
    redirect_to(articles_path)
  end

  def edit
  end

  def update

  end

  private

  def article_params #use this when you get a ActiveModel::ForbiddenAttributesError
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id]) #params[:id] comes from the url
  end
end

# C -create method
# R -index method
# U - need edit + update method
# D - destroy method
