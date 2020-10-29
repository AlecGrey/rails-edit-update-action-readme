class ArticlesController < ApplicationController

  before_action :new_article, only: [:new, :create]
  before_action :find_article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
  end

  def create
    @article = Article.create(sanitized_params)
    redirect_to article_path(@article)
  end

  # add edit and update methods here

  def edit
    render new_article_path
  end

  def update
    @article.update(sanitized_params)

    redirect_to article_path(@article)
  end

  private

  def new_article
    @article = Article.new
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def sanitized_params
    params.require(:article).permit(:title, :description).select do |k, v|
      v != ""
    end    
  end

end
