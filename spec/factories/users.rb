FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 10) }
    username { Faker::Name.name }
    age { rand(121) }
    gender { Faker::Gender.binary_type }
    height { Faker::Number.between(from: 100, to: 200) }
    weight { Faker::Number.between(from: 40, to: 120) }
    profile { Faker::Lorem.sentence }
    target_weight { Faker::Number.between(from: 40, to: 100) }
    target_body { Faker::Number.between(from: 5, to: 40) }
  end
end
