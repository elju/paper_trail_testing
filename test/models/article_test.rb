require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  a =  Article.new 
  a.title = "first" 
  a.text = "text stuff"
  a.save
    
  c = Comment.new
  c.text = "this is a comment"
  c.article = a
  c.save
    
  c = Comment.last
  c.text = "changed"
  c.save
    
  article = Article.last
    
  refied_article = article.reload.versions.last.reify(:has_many => true)
  
  puts refied_article.comments.inspect  #<ActiveRecord::Associations::CollectionProxy [#<Comment id: 980191006, text: "this is a comment", ....
  puts refied_article.comments.first.text == "this is a comment"  #TRUE
   
  
  test "adding versioning " do
    with_versioning do

      a =  Article.new 
      a.title = "first" 
      a.text = "text stuff"
      a.save
    
      c = Comment.new
      c.text = "this is a comment"
      c.article = a
      c.save
    
      c = Comment.last
      c.text = "changed"
      c.save
    
      article = Article.last
    
      refied_article = article.reload.versions.last.reify(:has_many => true)
      
      puts refied_article.comments.inspect  ##<ActiveRecord::Associations::CollectionProxy []>
      assert refied_article.comments.first.text == "this is a comment"  #undefined method `text' for nil:NilClass

    end
  end
  
  
  
end
