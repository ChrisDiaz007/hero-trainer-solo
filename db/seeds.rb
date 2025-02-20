# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create Users (Training Partners)
Booking.destroy_all
Lesson.destroy_all
User.destroy_all

CATEGORIES = ["Yoga", "Pilates", "CrossFit", "Martial Arts", "Tennis", "Swimming", "Cycling", "Boxing"]
JAPAN_CITIES = [
  "Tokyo", "Osaka", "Kyoto", "Yokohama", "Nagoya", "Fukuoka", "Sapporo",
  "Hiroshima", "Sendai", "Kobe", "Naha"
]

def japan_address
  "#{Faker::Address.street_address}, #{JAPAN_CITIES.sample}, Japan"
end

puts "Creating admin ... "
User.create!(
  name: "Arnie",
  email: "admin@admin.com",
  password: '123123',
  bio: Faker::Lorem.sentence,
  experience: "#{Faker::Number.between(from: 1, to: 20)} years in #{Faker::Job.field}",
  specialties: [
    Faker::Job.key_skill,
    Faker::Job.position,
    Faker::Job.employment_type
  ].join(", ")
)
puts "Admin created"

20.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: '123123',
    bio: Faker::Lorem.sentence,
    experience: "#{Faker::Number.between(from: 1, to: 20)} years in #{Faker::Job.field}",
    specialties: [
      Faker::Job.key_skill,
      Faker::Job.position,
      Faker::Job.employment_type
    ].join(", ")
  )
end

puts "Created #{User.count} users"

users = User.all
lessons = Lesson.all

users.each do |user|
  2.times do
    user.lessons.create!(
      title: Faker::Team.sport.capitalize,
      description: Faker::Lorem.sentence(word_count: 10),
      duration: Faker::Number.between(from: 30, to: 120),
      price: Faker::Number.between(from: 0, to: 200),
      capacity: Faker::Number.between(from: 5, to: 30),
      category: CATEGORIES.sample,
      address: "#{Faker::Address.street_address}, #{JAPAN_CITIES.sample}, Japan"
    )
  end
end

puts "Created #{Lesson.count} lessons"

30.times do
Booking.create!(
  start_time: Time.now + rand(0..5).days,
  status: "accepted",
  participants: 2,
  user: users.sample,
  lesson: lessons.sample
)
end

puts "Created #{Booking.count} bookings"
