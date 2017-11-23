require 'faker'
FactoryBot.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    confirmed_at Date.today
  end
end