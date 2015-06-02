class VersionsController < ApplicationController

  def view
    article = Article.find params[:id]
    refied_article = article.versions.last.reify(:has_many => true)
    @comments = refied_article.comments
    puts @comments.inspect
    render :text =>  @comments.inspect
  end
  
end