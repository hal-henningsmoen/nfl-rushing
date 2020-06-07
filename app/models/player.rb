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
end
