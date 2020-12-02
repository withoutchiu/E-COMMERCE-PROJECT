# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
AdminUser.delete_all
Category.delete_all
Color.delete_all
Brand.delete_all

NUMBERS_OF_CATEGORY_COLOR_BRAND = 10;

NUMBERS_OF_CATEGORY_COLOR_BRAND.times do
  category = Category.create(name: Faker::Creature::Horse.unique.breed, description: Faker::Creature::Horse.unique.name)
  color = Color.create(name: Faker::Color.unique.color_name, description: Faker::Color.unique.hsla_color)
  brand = Brand.create(name: Faker::Games::Dota.unique.hero, description: Faker::Games::Dota.unique.item)
end

(1...50).each do
  p = Product.create(name: Faker::Sports::Basketball.player,
                description: Faker::Sports::Basketball.team,
                price: Faker::Number.decimal(l_digits: 2),
                rating: Faker::Number.between(from: 1, to: 5),
                stock: Faker::Number.between(from: 1, to: 100),
                brand: Brand.offset(rand(Brand.count)).first,
                category: Category.offset(rand(Category.count)).first,
                color: Color.offset(rand(Color.count)).first
              )
  puts p.errors.messages
  query = URI.encode_www_form_component([p.name, p.description].join(","))
  downloaded_image = URI.open("https://source.unsplash.com/featured/?#{query},basketballshoes")
  p.image.attach(io: downloaded_image, filename: "m-#{[p.name, p.description].join('-')}.jpg")
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Category created #{Category.count}"
puts "Color created #{Color.count}"
puts "Brand created #{Brand.count}"
puts "Product created #{Product.count}"