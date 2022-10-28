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
    number_of_rolls = 10
    die_cup = DieCup.new
    die_cup.add_die(Die.new(6))
    die_cup.add_die(Die.new(6))
    min = number_of_rolls
    (1..number_of_rolls).each do
      rolled_value = die_cup.roll
      min = rolled_value < min ? rolled_value : min
    end
    puts "min = #{min}"

    expect(min).to be >= 1
  end

  it 'roll_max' do
    max = 0
    number_of_rolls = 10
    die_cup = DieCup.new
    die_cup.add_die(Die.new(6))
    die_cup.add_die(Die.new(6))
    (1..number_of_rolls).each do
      rolled_value = die_cup.roll
      max = rolled_value > max ? rolled_value : max
    end
    puts "max = #{max}"

    expect(max).to be <= 12
  end
end
