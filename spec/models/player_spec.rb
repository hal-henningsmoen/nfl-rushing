require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'when importing json' do
    [['1000T', true], ['1000t', true], ['1000 t', true],
     ['1,000 t', true], ['1000 ', false ]].each do |input, is_touchdown|
      it 'parses the integer value correctly for longest rush' do
        expect(Player.safe_load_longest_rush(input)).to eq(1000)
      end
      it 'identifies if longest rush was a touchdown' do
        expect(Player.is_rush_td?(input)).to eq(is_touchdown)
      end
    end

    [[100, 100], ['100', 100], ['1,000', 1000],
     ['-1,000', -1000], [-1, -1]].each do |input, correct_result|
      it "parses #{input} to correct integer value" do
        expect(Player.safe_load_int(input)).to eq(correct_result)
      end
    end

    [[100.0, 100.0], ['100.2', 100.2], ['1,000.01', 1000.01],
     ['-1,000.0', -1000.0], [-1.011, -1.011]].each do |input, correct_result|
      it "parses #{input} to correct float value" do
        expect(Player.safe_load_float(input)).to be_within(0.01).of(correct_result)
      end
    end
  end

  describe 'when exporting csv' do
    let(:players) { [Player.create( name: 'Name', team: 'Team', position: 'Position', attempts_per_game: 2.5, total_attempts: 3, total_yards: 4,
                                    average_yards_per_attempt: 5.5, yards_per_game: 6.5, rushing_touchdowns: 7, longest_rush: 8,
                                    longest_rush_is_touchdown: false, first_downs: 9, first_downs_percent: 10.5, twenty_plus: 11,
                                    forty_plus: 12, fumbles: 13)] }
    let(:data_columns) {Player.column_names.filter{ |col| !["id", "created_at", "updated_at"].include?(col) }}

    it "includes a header and correct data line" do
      header, line = Player.to_csv(players).split("\n")
      expect(header).to eq(*data_columns.join(','))
      expect(line).to eq(players.first.attributes.values_at(*data_columns).join(','))
    end
  end
end
