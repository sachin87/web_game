FactoryGirl.define do
  factory :gamer do
    name     "The Great Gamer"
    email    "gamer@example.com"
    password "password"
    password_confirmation "password"
  end
end