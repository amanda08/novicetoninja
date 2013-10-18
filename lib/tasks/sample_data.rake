namespace :db do 
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_goals
    # TODO: add make_activities
    make_relationships
  end
end

def make_users
  admin = User.create!(first_name: "Admin",
                         last_name: "User",
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
end

def make_goals
  users = User.all(limit: 6)
  10.times do
    content = Faker::Lorem.sentence(1)
    users.each { |user| user.goals.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each        { |follower| follower.follow!(user) }
end
