FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
    username { Faker::Name.name }
    age { rand(121) }
    height { rand(200) }
    weight { rand(200) }
    target_weight { rand(200) }
    target_body { rand(200) }
    profile { Faker::Lorem.sentence }
  end
end