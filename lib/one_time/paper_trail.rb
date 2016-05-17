a = Article.new
Article.transaction do
  a.comments.build
  a.comments.build
  a.save
end
Article.transaction do
  a.comments.last.destroy
  a.comments.reload
  a.comments.build
  a.save
  a.touch_with_version
end
previous_a = a.versions.first.next.reify(has_many: true)
pp previous_a.comments
