class ArticlesController < ApplicationController
  def search
    if params[:query].present?
      @articles = Article.search(params[:query]) # Assuming search method is defined on the model
    else
      @articles = Article.all
    end

    respond_to do |format|
      format.html # For regular HTTP requests
      format.js   # For AJAX requests
    end
  end
end
