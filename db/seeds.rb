# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#genre
genre = ['豚骨', '家系', '二郎', 'まぜそば', 'つけ麺', 'しょうゆ', '味噌', '塩', 'タンメン', 'その他']
genre.each.with_index(1) do |item, i|
  Genre.create!(id: i, genre: item)
end


user = User.new(nickname:  "ラーメン太郎",
  email: "test@test.com",
  password:              "11111111",
  password_confirmation: "11111111",)
user.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/ginnokura.png"),
              filename: "ginnnokura.png", content_type: "image/png")

user.save

25.times do |n|
  name = Faker::Pokemon.name
  password = "password"
  user = User.new(nickname: name,
               email: "test#{n}@gmail.com",
               password: password,
               password_confirmation: password,
             )
  user.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/jirou.png"),
  filename: "jirou.png", content_type: "image/png")
  user.save
end

users = User.all
user  = users.first
following = users[2..9]
followers = users[3..15]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


5.times do
  content = Faker::Lorem.sentence(5)
  users.each do |user|
    post = user.posts.new(impressions: content,genre_id: rand(1..10))
    post.image.attach(io: File.open("#{Rails.root}/app/assets/images/jirou.png"),
    filename: "jirou.png", content_type: "image/png")
    post.save
  end
end