class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    # @current_user = current_user
  end
end
