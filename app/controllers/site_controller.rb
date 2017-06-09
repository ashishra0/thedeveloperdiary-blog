class SiteController < ApplicationController
  def index
    @articles = current_user.nil? ? Article.all : current_user.articles
  end
end
