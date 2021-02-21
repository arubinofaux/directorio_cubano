# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

baseNumber = 53000000
maxNumber = 53539999

while TRUE
  puts("Cubacel: #{baseNumber}")
  
  Entry.create(phone: baseNumber)

  break if baseNumber == maxNumber
  baseNumber += 1
end