namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "hoge",
                 password: "hoge",
                 password_confirmation: "hoge")

    8.times do |n|
      name  = Faker::Name.name
      password  = "hoge"
      User.create!(name: name,                   
                   password: password,
                   password_confirmation: password)
    end

    users = User.limit(8)
    9.times do
     title = Faker::Lorem.sentence 
     content = Faker::Lorem.sentence(20)
     users.each { |user| user.articles.create!(title: title, content: content)} 
    end 
  end
end