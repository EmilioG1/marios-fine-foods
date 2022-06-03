# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all


50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
    cost: Faker::Number.between(from: 1, to: 20),
    country_of_origin: Faker::WorldCup.team,
    id: Faker::Number.unique.within(range: 1..50))
end
250.times do |index|
  Review.create!(author: Faker::Sports::Football.player,
      rating: Faker::Number.between(from: 1, to: 5),
      product_id: Faker::Number.between(from: 1, to: 50),
      content_body: Faker::Lorem.sentence(word_count: 150))
end
  
  p "Created #{Product.count} products"
  p "Created #{Review.count} reviews"