# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create users
require 'faker'

5.times do
  standard = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    role: 'standard'
    )
end

5.times do
  premium = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    role: 'premium'
    )
end

users = User.all
    
20.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Witcher.character,
    body: Faker::Witcher.quote,
    private: false
    )
end

puts "Seeds finished!"
puts "#{User.count} users created!"
puts "#{Wiki.count} wikis created!"