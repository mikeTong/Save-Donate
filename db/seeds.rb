# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


fake_url = ["R96rw9vEtiQ", "uIp6N89PH-c", "X6tKAUOMzCs"]

20.times do 
  o = Organization.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.cell_phone,
    short_description: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
  o.save
end
os = Organization.all

50.times do
  c = Company.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.cell_phone
  )
  c.save
  a = Advertisement.new(
    url: fake_url.sample,
    company_id: c.id,
    organization_id: os.sample.id
  )
  a.save 
  cou = Coupon.new(
    title: Faker::Lorem.word,
    short_description: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    advertisement_id: a.id
  )
  cou.save
end
