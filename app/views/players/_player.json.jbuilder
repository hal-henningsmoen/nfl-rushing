json.extract! player, :id, :name, :team, :position, :attempts_per_game, :total_attempts, :total_yards, :average_yards_per_attempt, :yards_per_game, :rushing_touchdowns, :longest_rush, :longest_rush_is_touchdown, :first_downs, :first_downs_percent, :twenty_plus, :forty_plus, :fumbles, :created_at, :updated_at
json.url player_url(player, format: :json)
