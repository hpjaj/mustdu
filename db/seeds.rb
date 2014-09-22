# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a member
member = User.new(
  name:       'Member User',
  email:      'member@example.com',
  password:   'password',
  )
member.skip_confirmation!
member.save!


5.times do 
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end
users = User.all

50.times do
  mustdo = Mustdo.new(
    user:         users.sample,
    description:  Faker::Lorem.sentence
    )
  mustdo.save
end
mustdos = Mustdo.all



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Mustdo.count} mustdos created"
