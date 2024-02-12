FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              aker::Internet.password(min_length: 6)}
    password_confirmation {password}
    fast                  
    last                  
    fast_read             
    last_read             
    birth                 
  end
end