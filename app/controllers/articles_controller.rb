class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = current_user.nil? ? Article.paginate(page: params[:page], per_page: 5).order('publish_date DESC') : current_user.articles.paginate(page: params[:page], per_page: 5).order('publish_date DESC')
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
