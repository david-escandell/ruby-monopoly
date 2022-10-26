# frozen_string_literal: true

# die_cup.rb

# represents the die cup
class DieCup
  def initialize
    @dice = []
  end

  def add_die(die)
    @dice.push die
  end

  def remove_die(die)
    @dice.delete die
  end

  def roll
    rolled_value = 0
    @dice.each |die| rolled_value = rolled_value + die.roll
    rolled_value
  end
end
