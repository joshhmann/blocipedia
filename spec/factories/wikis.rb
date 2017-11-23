require 'faker'
FactoryBot.define do
  factory :wiki do
    title Faker::Overwatch.hero
    body Faker::Overwatch.quote
    private false
    user nil
  end
end
