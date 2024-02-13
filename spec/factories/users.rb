FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { "やマ田" }
    first_name            { "ハな子" }
    last_name_kana        { "ヤマダ" }
    first_name_kana       { "ハナコ" }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end