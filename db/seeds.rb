User.create!(name: "Admin account", email: "admin@gmail.com",
  password: "admin123", role: 2, password_confirmation: "admin123", 
  address: "123 Nguyen Luong Bang", phone_number: "098732232")
User.create!(name: "Admin account", email: "admin1@gmail.com",
  password: "admin123", role: 1, password_confirmation: "admin123",
  address: "12 Bach Dang", phone_number: "01233291821")
User.create!(name: "User account", email: "user@gmail.com",
  password: "user123", role: 0, password_confirmation: "user123",
  address: "123 Ngo Thi Nham", phone_number: "0987138191")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  address = "#{n+1} Le Duan"
  phone_number = "0988777666"
  password = "password"
  User.create!(name: name, email: email, password: password, address: address,
    password_confirmation: password, phone_number: phone_number )
end

Category.create!(name: "Electronics")
Category.create!(name: "Computer/digital")
Category.create!(name: "Fashion")
Category.create!(name: "Vehicle")
Category.create!(name: "House")

30.times do |n|
  name  = "Product #{n+1}"
  price = (rand 100..10000)*1000
  avg_rating = rand 1..5
  category_id = rand 1..5
  description = Faker::Lorem.sentence 30
  Product.create!(name: name, price: price, category_id: category_id, 
    avg_rating: avg_rating, description: description)
end

30.times do |n|
  name  = "Suggest product #{n+1}"
  category_id = rand 1..5
  user_id = rand 3..10
  description = Faker::Lorem.sentence 30
  Suggestion.create!(product: name, category_id: category_id, user_id: user_id,
    description: description)
end
