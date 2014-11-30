User.destroy_all
50.times do
  User.create(
    email:    Faker::Internet.email,
    password: 'password')
end