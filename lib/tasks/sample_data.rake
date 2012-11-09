namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "theo@tvararu.ro",
                         password: "qazwsx123",
                         password_confirmation: "qazwsx123")
    admin.toggle!(:admin)
    99.times do |n|
      email = "example-#{n+1}@example.org"
      password = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end