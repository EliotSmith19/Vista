Review.destroy_all
Booking.destroy_all
Favourite.destroy_all
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

# Create Unique Villas
villas = []

villas << Villa.create!(
  villa_name: "Seaside Retreat",
  villa_location: "Malibu, California",
  img_url: "https://www.villaway.com/_next/image?url=https%3A%2F%2Fcdn.villaway.com%2Fvillaway%2F65fce47afaf070152efdcf15-qjpolxipdh-img.webp&w=1080&q=75", # Fill this in later
  description: "A luxurious seaside villa with stunning ocean views and modern amenities.",
  price: 1000.0,
  rating: 4.8,
  user: users.sample
)

villas << Villa.create!(
  villa_name: "Mountain Escape",
  villa_location: "Aspen, Colorado",
  img_url: "https://www.aspenluxuryvacationrentals.com/wp-content/uploads/2023/02/original_157473438-1.jpg", # Fill this in later
  description: "A cozy mountain villa perfect for ski vacations and enjoying nature.",
  price: 1500.0,
  rating: 4.9,
  user: users.sample
)

villas << Villa.create!(
  villa_name: "Tropical Paradise",
  villa_location: "Bali, Indonesia",
  img_url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/fb/bc/87/private-villas-of-bali.jpg?w=700&h=-1&s=1", # Fill this in later
  description: "An exotic villa surrounded by lush greenery and a private pool.",
  price: 800.0,
  rating: 4.7,
  user: users.sample
)

villas << Villa.create!(
  villa_name: "Urban Chic",
  villa_location: "New York City, New York",
  img_url: "https://greystone-on-hudson.com/uploads/img/10-image.jpg", # Fill this in later
  description: "A modern villa in the heart of the city with rooftop views and luxurious interiors.",
  price: 2000.0,
  rating: 4.6,
  user: users.sample
)

villas << Villa.create!(
  villa_name: "Desert Oasis",
  villa_location: "Palm Springs, California",
  img_url: "https://img.jamesedition.com/listing_images/2024/04/22/15/16/05/c81d99f6-fc79-4a80-9de0-71d15bde923c/je/760x470xc.jpg", # Fill this in later
  description: "A unique villa with a private pool and serene desert landscapes.",
  price: 1200.0,
  rating: 4.5,
  user: users.sample
)

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
