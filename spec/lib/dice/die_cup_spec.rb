# frozen_string_literal: true

require_relative('../../../lib/dice/die')
require_relative('../../../lib/dice/die_cup')

describe 'DieCup' do
  it 'roll_range' do
    die_cup = DieCup.new
    die_cup.add_die(Die.new(6))
    die_cup.add_die(Die.new(6))

    rolled_value = die_cup.roll
    expect((rolled_value >= 1) && (rolled_value <= 12))
  end

  it 'roll_min' do
    # number_of_sides = 6
    # rolled_value = DieCup.new.roll
    # min = number_of_rolls
    # [1..number_of_rolls].each do
    #   min = rolled_value < min ? rolled_value : min
    # end
    # expect(min == 1)
  end

  it 'roll_max' do
  #   number_of_rolls = 10_000
  #   number_of_sides = 6
  #   rolled_value = DieCup.new(number_of_sides).roll
  #   max = 0
  #   [1..number_of_rolls].each do
  #     max = rolled_value > max ? rolled_value : max
  #   end
  #   expect(max == number_of_sides)
  end
end
