# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
colors = ["красный", "оранжевый", "желтый", "зеленый", "голубой", "синий", "фиолетовый", "белый", "черный", "разноцветный"]
types = ['классический', "авторский", "в коробке", "в корзине"]

colors.each do |color|
  Color.create!(name: color)
end

types.each do |type|
  Type.create!(name: type)
end
