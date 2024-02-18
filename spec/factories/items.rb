FactoryBot.define do
  factory :item do
    association :user  # userと関連付けを行う
    item        { Faker::Name.initials(number: 2) }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }  # アクティブハッシュの値は2以上を指定する
    condition_id { 2 }
    burden_id { 2 }
    pref_id { 2 }
    period_id { 2 }
    price { 1000 } # 300以上9999999以下の範囲で任意の値を設定する
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end