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
    flash.notice = "Article '#{@article.title}' DELETED!!"
    redirect_to(articles_path)
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to article_path(@article)
    else
      render :edit
    end
    # want to update and then redirect to the show page
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
