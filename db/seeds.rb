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