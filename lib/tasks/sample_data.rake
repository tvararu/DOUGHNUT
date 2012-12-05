namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "theo@tvararu.ro",
                         password: "qwerty",
                         password_confirmation: "qwerty")
    admin.toggle!(:admin)
    99.times do |n|
      email = "#{Faker::Internet.email}"
      password = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end