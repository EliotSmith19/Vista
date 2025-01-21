# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Clear existing data to avoid duplication
Booking.destroy_all
Favourite.destroy_all
Review.destroy_all
Villa.destroy_all
User.destroy_all

# Create Users
users = []
5.times do |i|
  users << User.create!(
    email: "user#{i+1}@example.com",
    password: "password#{i+1}", # Replace with real encrypted password in production
    first_name: "FirstName#{i+1}",
    last_name: "LastName#{i+1}",
    phone_number: "123456789#{i}",
    address: "123 Example St, City#{i}",
    img_url: "https://kitt.lewagon.com/placeholder/users/cveneziani"
  )
end

# Create Villas
villas = []
5.times do |i|
  villas << Villa.create!(
    villa_name: "Luxury Villa #{i+1}",
    villa_location: "Location #{i+1}",
    img_url: "https://images.unsplash.com/photo-1636484807469-e33af13716b7?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    description: "A beautiful luxury villa located in Location #{i+1}.",
    price: (500 + i * 100).to_f,
    rating: (4.0 + i * 0.1).round(1),
    user: users.sample
  )
end

# Create Bookings
bookings = []
5.times do |i|
  bookings << Booking.create!(
    user: users.sample,
    villa: villas.sample,
    start_date: Date.today + i.days,
    end_date: Date.today + (i + 5).days,
    confirmed: [true, false].sample
  )
end

# Create Favourites
5.times do
  Favourite.create!(
    user: users.sample,
    villa: villas.sample
  )
end

# Create Reviews
5.times do
  Review.create!(
    description: "This is a review.",
    rating: rand(3.0..5.0).round(1),
    booking: bookings.sample
  )
end

puts "Seeding completed successfully!"
