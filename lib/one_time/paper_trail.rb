a = Article.new
Article.transaction do
  a.save
  a.comments << Comment.create
  a.comments << Comment.create
end
c = Comment.create
Article.transaction do
  ids = a.comment_ids
  ids.pop
  ids.push c.id
  a.comment_ids = ids
  a.save
end
previous_a = a.versions.first.next.reify(has_many: true)
pp previous_a.comments
