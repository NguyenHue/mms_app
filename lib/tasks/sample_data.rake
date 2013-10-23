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
    users = User.all(limit: 10)
    20.times do
      users.each { |user| 
              name = Faker::Lorem.sentence(5)

              team = user.teams.create!(name: name) 
              team.members.create!(user_id: user.id)
      }
    end


    teams = Team.all()
    teams.each { |team| 
                20.times do
                user = User.first(:offset => rand(User.count))
                TeamMember.create!(user_id:  user.id, team_id: team.id) 
            #    team.members.create!(user_id:  user.id) if !team.members.find_by(user_id: user.id).nil?
            end
    }
  end
end