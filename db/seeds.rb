# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "creating 5 new restaurants"

10.times do
  Restaurant.create(name: Faker::Restaurant.name, category: ["chinese", "italian", "japanese", "french", "belgian"].sample, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number)
end

puts "there are now #{Restaurant.count} restaurants"

puts "creating random reviews"

50.times do
  review_for = Restaurant.all.sample
  new_review = Review.new(rating: (0..5).to_a.sample, content: Faker::Restaurant.review)
  new_review.restaurant = review_for
  new_review.save
end
