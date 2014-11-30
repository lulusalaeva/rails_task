after :users do
  Post.destroy_all
  User.find_each do |user|
    rand(0..10).times do
      post = user.posts.build(
        title:   Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph(5))
      post.save
    end
  end
end