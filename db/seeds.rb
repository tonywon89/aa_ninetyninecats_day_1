# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




20.times do
  Cat.create!(
  name: "#{Faker::Name.name}, #{Faker::Name.title}",
  color: "pink",
  sex: "M",
  birth_date: Faker::Date.forward(25),
  description: Faker::Hipster.paragraph,
  )
end


CatRentalRequest.create!(
  cat_id: 1,
  start_date: 2.days.ago,
  end_date:  Date.today
  )

CatRentalRequest.create!(
  cat_id: 1,
  start_date: 1.days.ago,
  end_date:  Date.today
  )

# CatRentalRequest.create!(
#   cat_id: 1,
#   start_date: 3.days.ago,
#   end_date: Date.today,
#   status: "APPROVED"
# )
