FactoryBot.define do
  factory :application do
    job { association :job }
    candidate_id { Faker::Number.unique.number(digits: 10) }
    notes { Faker::Lorem.paragraph }
    status { :draft }
  end
end
