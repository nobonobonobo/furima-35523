FactoryBot.define do
  factory :furima do
    name {"りんご"}
    price {"100"}
    description {"美味しいよ"}
    category_id {2}
    prefecture_id {2}
    condition_id {2}
    shipping_date_id {2}
    postage_id {2}
    association :user
  end
end
