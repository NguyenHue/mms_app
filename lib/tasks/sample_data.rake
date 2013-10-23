namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Nguyen Thi Hue",
                         email: "nguyen.thi.hue@framgia.com",
                         age: "24",
                         password: "123456",
                         password_confirmation: "123456",
                         admin: true)
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   age: age,
                   password: password,
                   password_confirmation: password)
    end
  end
end