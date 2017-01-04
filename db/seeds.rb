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

Category.create!(name: "Electronics")
Category.create!(name: "Computer/digital")
Category.create!(name: "Fashion")
Category.create!(name: "Vehicle")
Category.create!(name: "House")

30.times do |n|
  name  = "Product #{n+1}"
  price = (rand 100..10000)*1000
  category_id = rand 1..5
  description = Faker::Lorem.sentence 30
  Product.create!(name: name, price: price, category_id: category_id, description: description)
end

30.times do |n|
  name  = "Suggest product #{n+1}"
  category_id = rand 1..5
  user_id = rand 3..10
  description = Faker::Lorem.sentence 30
  Suggestion.create!(product: name, category_id: category_id, user_id: user_id,
    description: description)
end
