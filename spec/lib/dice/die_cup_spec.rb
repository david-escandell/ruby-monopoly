# frozen_string_literal: true

require_relative '../../../lib/dice/die'
require_relative '../../../lib/dice/die_cup'

describe DieCup do
  context "when loaded with 2 dice" do
    let(:die1) { Die.new }
    let(:die2) { Die.new }
    let(:die_cup) { DieCup.new }
    let(:load) { die_cup.add_dice(die1, die2) }

    before do
      load
    end

    it "should roll a random number between 2 and 12" do
      expect(die_cup.roll).to be_between(1, 12)
      1000.times { die_cup.roll }
    end

    it "should roll a minimum of 2" do
      min = die_cup.dice.reduce(0) { |total, die| total + die.num_sides } # 12
      1000.times do
        rolled_value = die_cup.roll
        min = rolled_value < min ? rolled_value : min
      end
      expect(min).to eq(2)
    end

    it "should roll a maximum of 12" do
      max = 1
      1000.times do
        rolled_value = die_cup.roll
        max = rolled_value > max ? rolled_value : max
      end
      expect(max).to eq(12)
    end
  end
end
