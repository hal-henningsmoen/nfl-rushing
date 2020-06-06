class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :position
      t.float :attempts_per_game
      t.integer :total_attempts
      t.integer :total_yards
      t.float :average_yards_per_attempt
      t.float :yards_per_game
      t.integer :rushing_touchdowns
      t.integer :longest_rush
      t.boolean :longest_rush_is_touchdown
      t.integer :first_downs
      t.float :first_downs_percent
      t.integer :twenty_plus
      t.integer :forty_plus
      t.integer :fumbles

      t.timestamps
    end
  end
end
