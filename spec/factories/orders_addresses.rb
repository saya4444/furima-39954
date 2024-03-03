FactoryBot.define do
  factory :orders_addresses do
    item_id       {1}
    user_id       {1}
    token         {"tok_abcdefghijk00000000000000000"}
    post_code     {"123-4567"}
    pref_id       {2}
    munic         {"大阪市北区"}
    address       {"梅田1-1-1"}
    building      {"テストビル"}
    tel           {"09012345678"}
  end
end
