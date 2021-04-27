FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
    username { Faker::Name.name }
    age { Faker::Number.within(range: 1..100) }
    gender { Faker::Gender.binary_type }
    height { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    weight { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    profile { Faker::Lorem.sentence }
    target_weight { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    target_body { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
  end
end
