# frozen_string_literal: true

require_relative '../../../lib/dice/die'

describe Die do
  context "without a given number of sides" do
    let(:die) { Die.new }

    it "should default to six sides" do
      expect(die.num_sides).to eq(6)
    end

    it "should roll a random number between one and six" do
      expect(die.roll).to be_between(1, 6)
      1000.times { die.roll }
    end

    it "should roll a minimum of 1" do
      min = die.num_sides
      1000.times do
        rolled_value = die.roll
        min = rolled_value < min ? rolled_value : min
      end
      expect(min).to eq(1)
    end

    it "should roll a maximum of 6" do
      max = 1
      1000.times do
        rolled_value = die.roll
        max = rolled_value > max ? rolled_value : max
      end
      expect(max).to eq(6)
    end
  end

  context "given 12 sides" do
    let(:die) { Die.new(12) }

    it "should roll a number between 1 and 12" do
      expect(die.roll).to be_between(1, 12)
      1000.times { die.roll }
    end

    it "should roll a minimum of 1" do
      min = die.num_sides
      1000.times do
        rolled_value = die.roll
        min = rolled_value < min ? rolled_value : min
      end
      expect(min).to eq(1)
    end

    it "should roll a maximum of 12" do
      max = 1
      1000.times do
        rolled_value = die.roll
        max = rolled_value > max ? rolled_value : max
      end
      expect(max).to eq(12)
    end
  end
end
