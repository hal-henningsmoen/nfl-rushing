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
    let(:player1) { Player.create{} }
  end
end
