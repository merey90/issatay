User.create!(name:  "Merey Zholdas",
             email: "merey.90@gmail.com",
             password:              "1212Aggg",
             password_confirmation: "1212Aggg",
             admin: true)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                 email: email,
#                 password:              password,
#                 password_confirmation: password,
#                 activated: true,
#                 activated_at: Time.zone.now)
# end

# users = User.order(:created_at).take(6)

# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.microposts.create!(content: content) }
# end