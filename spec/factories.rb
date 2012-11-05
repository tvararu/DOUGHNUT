FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
  
  factory :transaction do
    sequence(:value) { |n| "#{n}" }
    sequence(:description) { |n| "Description #{n}" }
    date "05 Nov 2012"
    user
  end
end