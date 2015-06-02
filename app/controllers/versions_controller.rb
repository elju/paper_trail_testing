class VersionsController < ApplicationController

  def view
    article = Article.find params[:id]
    refied_article = article.versions.last.reify(:has_many => true)   
    render :text =>  refied_article.inspect
  end
  
end