# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
list = List.create(name: "Forgetful List", color: "Black")
lunch = Reminder.create(name: "Meet with betty", description: "She said to not forget!!", date: "05-25-2021", time: "6:00")
