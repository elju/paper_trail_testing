class Comment < ActiveRecord::Base
  belongs_to :article
  has_paper_trail
  
  after_save :touch_article
  
  def touch_article
    article.touch_with_version
  end

end
