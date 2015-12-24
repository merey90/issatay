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

user = User.first

50.times do
    title = Faker::Lorem.sentence(5)
    title_kz = Faker::Lorem.sentence(5)
    title_ru = Faker::Lorem.sentence(5)
    
    short_body = Faker::Lorem.paragraph(5)
    short_body_kz = Faker::Lorem.paragraph(5)
    short_body_ru = Faker::Lorem.paragraph(5)
    
    body = Faker::Lorem.paragraph(20)
    body_kz = Faker::Lorem.paragraph(20)
    body_ru = Faker::Lorem.paragraph(20)
    
  
    user.presses.create!(   title: title,
                            title_kz: title_kz,
                            title_ru: title_ru,
                            short_body: short_body,
                            short_body_kz: short_body_kz,
                            short_body_ru: short_body_ru,
                            body: body,
                            body_kz: body_kz,
                            body_ru: body_ru,)
end