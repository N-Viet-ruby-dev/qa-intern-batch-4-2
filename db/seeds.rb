5.times do |n|
  name  = Faker::Name.name
  Category.create!(name: name)
end

10.times do |n|
  name  = Faker::Name.name
  Tag.create!(name: name)
end


#User fake-data
User.create!(name:  "Admin",
             email: "admin@localhost.com",
             phone: "0376888998",
             address: "K55/07 Ngu Hanh Son - Da Nang",
             picture: nil,
             password:              "111111",
             password_confirmation: "111111",)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  phone = "0935535325"
  address = Faker::Address.full_address
  picture = nil
  password = "password"
  User.create!(name:  name,
              email: email,
              phone: "0376888998",
              address: "K55/07 Ngu Hanh Son - Da Nang",
              picture: nil,
              password:              "111111",
              password_confirmation: "111111",)
end


#questions fake-data

users = User.order(:created_at).take(6)
10.times do
  title = Faker::Lorem.question
  category_id = Category.first.id
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.questions.create!(title: title, category_id: category_id, content: content) }
end
