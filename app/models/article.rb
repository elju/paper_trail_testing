class Article < ActiveRecord::Base
  has_many :comments,
           after_add: :save_article_version,
           after_remove: :save_article_version
  has_paper_trail

  def save_article_version(*args)
    touch_with_version if persisted?
  end
end
