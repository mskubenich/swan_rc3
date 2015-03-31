FactoryGirl.define do

  factory :user do
    first_name "Example"
    last_name "User"
    full_name "Example User"
    email "user@example.com"
    password "secret"
  end

end
