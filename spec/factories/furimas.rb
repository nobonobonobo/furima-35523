FactoryBot.define do
  factory :furima do
    name {"りんご"}
    price {10000}
    description {"美味しいよ"}
    category_id {2}
    prefecture_id {2}
    condition_id {2}
    shipping_date_id {2}
    postage_id {2}
    association :user
    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
