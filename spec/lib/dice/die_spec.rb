# frozen_string_literal: true

require_relative('../../../lib/dice/die')

def test_roll_range(number_of_sides)
  # number_of_sides = 8
  rolled_value = Die.new(number_of_sides).roll
  expect((rolled_value >= 1) && (rolled_value <= number_of_sides))
end

def test_roll_min(number_of_rolls, number_of_sides)
  # number_of_rolls = 10_000
  # number_of_sides = 6
  rolled_value = Die.new(number_of_sides).roll
  min = number_of_rolls
  [1..number_of_rolls].each do
    min = rolled_value < min ? rolled_value : min
  end
  expect(min == 1)
end

def test_roll_max(number_of_rolls, number_of_sides)
  # number_of_rolls = 10_000
  # number_of_sides = 6
  rolled_value = Die.new(number_of_sides).roll
  max = 0
  [1..number_of_rolls].each do
    max = rolled_value > max ? rolled_value : max
  end
  expect(max == number_of_sides)
end

describe 'eight sided die' do
  it 'roll_range' do
    test_roll_range(8) 
    # number_of_sides = 8
    # rolled_value = Die.new(number_of_sides).roll
    # expect((rolled_value >= 1) && (rolled_value <= number_of_sides))
  end
end

describe 'six sided die' do
  it 'roll_range' do
    test_roll_range(6) 
    # number_of_sides = 6
    # rolled_value = Die.new(number_of_sides).roll
    # expect((rolled_value >= 1) && (rolled_value <= number_of_sides))
  end

  it 'roll_min' do
    test_roll_min(10_000, 6)
    # number_of_rolls = 10_000
    # number_of_sides = 6
    # rolled_value = Die.new(number_of_sides).roll
    # min = number_of_rolls
    # [1..number_of_rolls].each do
    #   min = rolled_value < min ? rolled_value : min
    # end
    # expect(min == 1)
  end

  it 'roll_max' do
    test_roll_max(10_000, 6)
    # number_of_rolls = 10_000
    # number_of_sides = 6
    # rolled_value = Die.new(number_of_sides).roll
    # max = 0
    # [1..number_of_rolls].each do
    #   max = rolled_value > max ? rolled_value : max
    # end
    # expect(max == number_of_sides)
  end
end
