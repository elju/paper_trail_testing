class Article < ActiveRecord::Base
  has_many :comments, autosave: true
  has_paper_trail
end
