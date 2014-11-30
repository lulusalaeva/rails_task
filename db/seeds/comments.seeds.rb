after :users, :posts do
  Comment.destroy_all
  User.find_each do |user|
    rand(0..25).times do
      comment = user.comments.build(
        content: Faker::Lorem.paragraph(2),
        post_id: Post.offset(rand(Post.count)).first.id)
      comment.save
    end
  end
end