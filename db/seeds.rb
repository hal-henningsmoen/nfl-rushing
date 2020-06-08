# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

path = File.join(File.dirname(__FILE__), "./seeds/rushing.json")
records = JSON.parse(File.read(path))
Player.load_json(records)
puts 'players are seeded'