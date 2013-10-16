namespace :db do 
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first_name: "Super User",
                         last_name: "Super",
                         email: "super@whoiscoco.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    99.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "example-#{n+1}@whoiscoco.com"
      password = "password"
      User.create!(first_name: first_name,
                  last_name: last_name,
                  email: email,
                  password: password,
                  password_confirmation: password)
    end

    users = User.all(limit: 6)
    5.times do
      content = Faker::Lorem.sentence(1)
      users.each { |user| user.goals.create!(content: content) }
    end
    
  end  
end