FactoryBot.define do
  factory :job do
    job_type { association :job_type }
    company_id { Faker::Number.unique.number(digits: 10) }
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    requirements { Faker::Lorem.sentences(number: 3).join(' ') }
    expired_date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    location { Faker::Address.full_address }
    no_of_vacancies { Faker::Number.between(from: 1, to: 10) }
    status { :pending }
  end
end
