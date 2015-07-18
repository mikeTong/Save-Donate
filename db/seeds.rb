# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


fake_url = ["R96rw9vEtiQ", "uIp6N89PH-c", "X6tKAUOMzCs"]

10.times do 
  a = Advertisement.new(
    url: fake_url.sample
  )
  a.save
end