a = Article.new
Article.transaction do
  a.comments << Comment.new
  a.comments << Comment.new
  a.save
end
Article.transaction do
  c = Comment.new
  c.save
  ids = a.comment_ids
  ids.pop
  ids.push c.id
  a.comment_ids = ids
  a.touch_with_version
end
previous_a = a.versions.first.next.reify(has_many: true)
pp previous_a.comments
