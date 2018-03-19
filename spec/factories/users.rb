FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@example.com" }
    password 'password'

    trait :confirmed do
      confirmed_at { Time.current }
    end
  end
end
