FactoryBot.define do
  factory :graph do
    # date { Faker::Date.between_except(from: 1.week.ago, to: 1.week.from_now, excepted: Date.today) }
    # date { Faker::Date.between_except(from: 3.week.ago, to: 3.week.from_now, excepted: Date.today) }
    # date { Faker::Date.between_except(from: 1.month.ago, to: 1.month.from_now, excepted: Date.today) }
    # date { Faker::Date.between_except(from: 3.month.ago, to: 3.month.from_now, excepted: Date.today) }
    # weight { rand(200) }
    user
  end
end