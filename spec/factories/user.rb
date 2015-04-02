FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    full_name  "John Doe"
    sequence(:email){|n| "user_#{n}@gmail.com" }
    password   "secret"
  end
end