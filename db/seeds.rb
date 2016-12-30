# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Admin account", email: "admin@gmail.com",
  password: "admin123", role: 2, password_confirmation: "admin123")
User.create!(name: "Admin account", email: "admin1@gmail.com",
  password: "admin123", role: 1, password_confirmation: "admin123")
User.create!(name: "User account", email: "user@gmail.com",
  password: "user123", role: 0, password_confirmation: "user123")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end
