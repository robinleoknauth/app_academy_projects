FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    session_token "MyString" 
    password_digest "MyString"
  end
end
