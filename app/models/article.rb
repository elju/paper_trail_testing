class Article < ActiveRecord::Base
  has_many :comments
  has_paper_trail
end
