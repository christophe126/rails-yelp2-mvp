require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
User.destroy_all

User.create(email: "christophe@gmail.com", password: "christophe")

user = User.first

10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: "french",
    user_id: user.id
  )
  3.times do
    Review.create(
      content: Faker::Restaurant.review,
      rating: Faker::Number.within(range: 0..5),
      restaurant: restaurant
    )
  end
end
