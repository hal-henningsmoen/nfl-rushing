# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def safe_load_int(input)
  input.to_s.delete(',').to_i
end

def safe_load_float(input)
  input.to_s.delete(',').to_f
end

def safe_load_longest_rush(input)
  safe_load_int(input.to_s.delete('t', 'T'))
end

def is_rush_td?(input)
  input.to_s.upcase.ends_with?('T')
end

path = File.join(File.dirname(__FILE__), "./seeds/rushing.json")
records = JSON.parse(File.read(path))
records.each do |rec|
  Player.create!({ name: rec['Player'], team: rec['Team'], position: rec['Pos'],
                  attempts_per_game: safe_load_float(rec['Att']), total_attempts: safe_load_int(rec['Att/G']),
                  total_yards: safe_load_int(rec['Yds']), average_yards_per_attempt: safe_load_float(rec['Avg']),
                  yards_per_game: safe_load_float(rec['Yds/G']), rushing_touchdowns: safe_load_int(rec['TD']),
                  longest_rush: safe_load_longest_rush(rec['Lng']), longest_rush_is_touchdown: is_rush_td?(rec['Lng']),
                  first_downs: safe_load_int(rec['1st']), first_downs_percent: safe_load_float(rec['1st%']),
                  twenty_plus: safe_load_int(rec['20+']), forty_plus: safe_load_int(rec['40+']),
                  fumbles: safe_load_int(rec['FUM']) })
end
puts 'players are seeded'