99.times do |n|
  name  = Faker::Name.name
  email = "sample-user-#{n+1}@email.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end