class VersionsControllerTest < ActionController::TestCase
 

  test "should get version" do
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
    
    aa = Article.last
    
    aa.text = "cscs"
    aa.save
    
    get :view, :id => Article.last.id
    assert_response :success

  end
end