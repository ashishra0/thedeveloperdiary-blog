class SiteController < ApplicationController
  def index
    @articles = current_user.nil? ? Article.paginate(page: params[:page], per_page: 5) : current_user.articles.paginate(page: params[:page], per_page: 5)
  end
end
