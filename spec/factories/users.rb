FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"山田"}
    first_name {"太朗"}
    family_name_ruby {"ヤマダ"}
    first_name_ruby {"タロウ"}
    birthday {"1992-11-03"}
  end
end