class Player < ApplicationRecord
  require 'csv'
  self.per_page = 25

  def self.to_csv(players)
    CSV.generate do |csv|
      data_columns = column_names.filter{ |col| !["id", "created_at", "updated_at"].include?(col) }
      csv << data_columns
      players.each do |player|
        csv << player.attributes.values_at(*data_columns)
      end
    end
  end

  def self.load_json(records)
    records.each do |rec|
      Player.create!({ name: rec['Player'], team: rec['Team'], position: rec['Pos'],
                       attempts_per_game: safe_load_float(rec['Att']),
                       total_attempts: safe_load_int(rec['Att/G']), total_yards: safe_load_int(rec['Yds']),
                       average_yards_per_attempt: safe_load_float(rec['Avg']),
                       yards_per_game: safe_load_float(rec['Yds/G']),
                       rushing_touchdowns: safe_load_int(rec['TD']),
                       longest_rush: safe_load_longest_rush(rec['Lng']),
                       longest_rush_is_touchdown: is_rush_td?(rec['Lng']),
                       first_downs: safe_load_int(rec['1st']),
                       first_downs_percent: safe_load_float(rec['1st%']),
                       twenty_plus: safe_load_int(rec['20+']), forty_plus: safe_load_int(rec['40+']),
                       fumbles: safe_load_int(rec['FUM']) })
    end
  end

  def self.safe_load_int(input)
    input.to_s.delete(',').to_i
  end

  def self.safe_load_float(input)
    input.to_s.delete(',').to_f
  end

  def self.safe_load_longest_rush(input)
    safe_load_int(input.to_s.delete('t', 'T'))
  end

  def self.is_rush_td?(input)
    input.to_s.upcase.ends_with?('T')
  end
end
